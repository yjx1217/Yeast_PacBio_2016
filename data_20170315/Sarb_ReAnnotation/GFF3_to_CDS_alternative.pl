#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
# depend on the CDS order on the negative strand

my ($refseq_file, $gff_file, $output);
GetOptions('refseq|r:s' => \$refseq_file,
	   'gff|g:s' => \$gff_file,
	   'output|o:s' => \$output);


my $refseq_fh = read_file($refseq_file);
my %refseq = parse_fasta_file($refseq_fh);
my %gene_name;
my $gff_fh = read_file($gff_file);
my @gene = ();
my %gff = parse_gff_file($gff_fh);
my %cds = ();
my $output_fh = write_file($output);



foreach my $gene_id (sort keys %gff) {
    if ($gene_id !~ /ps/) {
	foreach my $mRNA_id (sort keys %{$gff{$gene_id}}) {
	    # print "mRNA_id = $mRNA_id\n";
	    # print "mRNA_id = $mRNA_id > $gff{$gene_id}{$mRNA_id}{'mRNA'}\n";
	    #sleep(2);
	    my ($chr, $start, $end, $strand) = ($gff{$gene_id}{$mRNA_id}{'mRNA'} =~ /(\S+):(\d+)-(\d+):(\+|\-)/);
	    $cds{$gene_id}{$mRNA_id} = "";
	    # print "strand=$strand\tcds: @{$gff{$gene_id}{$mRNA_id}{'core'}}\n";
	    if (exists $gff{$gene_id}{$mRNA_id}{'core'}) {
		my @core = @{$gff{$gene_id}{$mRNA_id}{'core'}};
		foreach my $core (@core) {
		    my ($chr_core, $start_core, $end_core, $strand_core) = ($core =~ /(\S+):(\d+)-(\d+):(\+|\-)/);
		    # print "gene_id = $gene_id, start_core = $start_core, end_core = $end_core\n";
		    my $core_seq = substr $refseq{$chr_core}, $start_core - 1, $end_core - $start_core + 1;
		    #if ($strand eq '+') {
		    $cds{$gene_id}{$mRNA_id} = $cds{$gene_id}{$mRNA_id}.$core_seq;
		    #} else {
		    #    $cds{$gene_id}{$mRNA_id} = $core_seq.$cds{$gene_id}{$mRNA_id};
		    #}
		}
		if ($strand eq '-') {
		    $cds{$gene_id}{$mRNA_id} = revcom($cds{$gene_id}{$mRNA_id});
		}
		#print $output_fh ">$gene_id|$mRNA_id\n$cds{$gene_id}{$mRNA_id}\n";
	    } else {
		print "Warning: no CDS info for gene_id=$gene_id, mRNA_id=$mRNA_id\n";
	    }
	}
    }

}

foreach my $gene_id (@gene) {
    if (exists $cds{$gene_id}) {
	my @mRNA_id = keys %{$cds{$gene_id}};
	foreach my $mRNA_id (@mRNA_id) {
	    if (exists $gene_name{$gene_id}) {
		print $output_fh ">$gene_id|$mRNA_id|$gene_name{$gene_id}\n$cds{$gene_id}{$mRNA_id}\n";
	    } else {
		print $output_fh ">$gene_id|$mRNA_id\n$cds{$gene_id}{$mRNA_id}\n";
	    }
	}
    } else {
	print "Warning: no CDS infor for gene_id=$gene_id\n";
    }
}


sub read_file {
    my $file = shift @_;
    my $fh;
    if ($file =~ /\.gz$/) {
        open($fh, "gunzip -c $file |") || die "can't open pipe to $file";
    } else {
        open($fh, $file) || die "can't open $file";
    }
    return $fh;
}

sub write_file {
    my $file = shift @_;
    my $fh;
    if ($file =~ /.gz$/) {
	open($fh, "| gzip -c >$file") or die "can't open $file\n";
    } else {
	open($fh, ">$file") or die "can't open $file\n";
    }
    return $fh;
}  



sub parse_fasta_file {
  my $fh = shift @_;
  my %seq;
  my $seq_name = "";
  my $flag = 0;
  while (<$fh>) {
    chomp;
    if (/^\s*$/) {
      next;
    } elsif (/^\s*#/) {
      next;
    } elsif (/^>(.*)/) {
      $seq_name = $1;
      $seq{$seq_name} = "";
    } else {
      $seq{$seq_name} .= $_;
    }
  }
  return %seq;
}


sub parse_gff_file {
    my $fh = shift @_;
    my %gff = ();
    my ($gene_id, $gene_name, $mRNA_id, $CDS_id, $mRNA_parent, $CDS_parent);
    while (<$fh>) {
	chomp;
	(/^\s*\#/) and next;
	(/^\#/) and next;
	my @line = split /\t/, $_;
	my $chr = $line[0];
	my $type = $line[2];
	my $start = $line[3];
	my $end = $line[4];
	my $strand = $line[6];
	my $phase = $line[7];
	my $annotation = $line[8];
	# print "annotation = $annotation\n";
	if ($type eq 'gene') {
	    if ($annotation =~ /ID=([^;]+);\S*Name=([^;]+)/) {
		$gene_id = $1;
		$gene_name = $2;
		#print "sub func gene_id=$gene_id;gene_name=$gene_name\n";
		push @gene, $gene_id;
		$gene_name{$gene_id} = $gene_name;
	    } else {
		($gene_id) = ($annotation =~ /ID=([^;]+)/);
	    }
	    #$gff{$gene_id}{'gene_name'} = $gene_name;
	} elsif (($type eq 'mRNA') or ($type eq 'transcript')) {
	    ($mRNA_id, $mRNA_parent) = ($annotation =~ /ID=([^;]+);\S*Parent=([^;]+)/);
	    $gff{$mRNA_parent}{$mRNA_id}{'mRNA'} = "$chr:$start-$end:$strand";
	} elsif ($type eq 'CDS') {
	    ($CDS_id, $CDS_parent) = ($annotation =~ /ID=([^;]+);\S*Parent=([^;]+)/);
	    if (not exists $gff{$gene_id}{$CDS_parent}{'core'}) {
		@{$gff{$gene_id}{$CDS_parent}{'core'}} = ("$chr:$start-$end:$strand");
	    } else {
		push @{$gff{$gene_id}{$CDS_parent}{'core'}}, "$chr:$start-$end:$strand";
	    }
	} elsif ($type =~ /(UTR|exon)/) {
	    next;
	} else {
	    # print "unexpected type: $type\n";
	    next;
	}
    }
    return %gff;
}

    
sub revcom {
  my $seq = shift @_;
  my $seq_revcom = reverse $seq;
  $seq_revcom =~ tr/ATGCatgc/TACGtacg/;
  return $seq_revcom;
}
