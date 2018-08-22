#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;

my ($input, $output);
GetOptions('input|i:s' => \$input,
	   'output|o:s' => \$output);

my $input_fh = read_file($input);
my @input;
my %input = parse_fasta_file($input_fh);
my $output_fh = write_file($output);
my $output2 = "$input.trimmed.fa";
my $output2_fh = write_file($output2);
my $error = "cds2protein_failed.txt";
my $error_fh = write_file($error);

foreach my $id (@input) {
    #print "id = $id\n";
    my $cds = uc $input{$id};
    my $cds_length = length $cds;
    my $length_test = $cds_length % 3;
    my $cds_trim = $cds;
    if ($length_test !=0) {
	print "incorrect_length: $id\n";
	print $error_fh "incorrect_length: $id\n";
	# if phase0
	my $cds_phase0 = substr $cds, 0, $cds_length-$length_test;
	my $pep_phase0 = translate($cds_phase0);
	my $pep_phase0_stop_count = () = $pep_phase0 =~ /\*/g;
	my $cds_phase1 = substr $cds, 1, $cds_length-$length_test + 1;
	my $pep_phase1 = translate($cds_phase1);
	my $pep_phase1_stop_count = () = $pep_phase1 =~ /\*/g;
	my $cds_phase2 = substr $cds, 2, $cds_length-$length_test + 2;
	my $pep_phase2 = translate($cds_phase2);
	my $pep_phase2_stop_count = () = $pep_phase2 =~ /\*/g;
	if (($pep_phase0_stop_count <= $pep_phase1_stop_count) and ($pep_phase0_stop_count <= $pep_phase2_stop_count)) {
	    print "my guess is phase 0, resulting a total of $pep_phase0_stop_count stop codons\n";
	    $cds_trim = $cds_phase0;
	} elsif (($pep_phase1_stop_count <= $pep_phase0_stop_count) and ($pep_phase1_stop_count <= $pep_phase2_stop_count)) {
            print "my guess is phase 1, resulting a total of $pep_phase1_stop_count stop codons\n";
            $cds_trim = $cds_phase1;
	} elsif (($pep_phase2_stop_count <= $pep_phase0_stop_count) and ($pep_phase2_stop_count <= $pep_phase1_stop_count)) {
            print "my guess is phase 2, resulting a total of $pep_phase2_stop_count stop codons\n";
            $cds_trim = $cds_phase2;
	}
    }
    print $output2_fh ">$id\n$cds_trim\n";
    my $protein = translate($cds_trim);
    $protein =~ s/\*$//;
    print $output_fh ">$id\n$protein\n";
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
	    push @input, $seq_name;
	    $seq{$seq_name} = "";
	} else {
	    $seq{$seq_name} .= $_;
	}
    }
    return %seq;
}


sub translate {
    my $dna = shift @_;
    my $protein = "";
    for (my $i = 0; $i < (length($dna) - 2); $i += 3) {
	$protein .= codon2aa(substr($dna, $i, 3));
    }
    return $protein;
}


sub codon2aa {
#
# codon2aa
#
# A subroutine to translate a DNA 3-character codon to an amino acid
#   Version 3, using hash lookup
    
    my $codon  = shift @_;
    
    $codon = uc $codon;
    
    my (%genetic_code) = (
	
	'TCA' => 'S',    # Serine
	'TCC' => 'S',    # Serine
	'TCG' => 'S',    # Serine
	'TCT' => 'S',    # Serine
	'TCN' => 'S',
	'TTC' => 'F',    # Phenylalanine
	'TTT' => 'F',    # Phenylalanine
	'TTA' => 'L',    # Leucine
	'TTG' => 'L',    # Leucine
	'TAC' => 'Y',    # Tyrosine
	'TAT' => 'Y',    # Tyrosine
	'TAA' => '*',    # Stop
	'TAG' => '*',    # Stop
	'TGC' => 'C',    # Cysteine
	'TGT' => 'C',    # Cysteine
	'TGA' => '*',    # Stop
	'TGG' => 'W',    # Tryptophan
	'CTA' => 'L',    # Leucine
	'CTC' => 'L',    # Leucine
	'CTG' => 'L',    # Leucine
	'CTT' => 'L',    # Leucine
	'CTN' => 'L',
	'CCA' => 'P',    # Proline
	'CCC' => 'P',    # Proline
	'CCG' => 'P',    # Proline
	'CCT' => 'P',    # Proline
	'CCN' => 'P',
	'CAC' => 'H',    # Histidine
	'CAT' => 'H',    # Histidine
	'CAA' => 'Q',    # Glutamine
	'CAG' => 'Q',    # Glutamine
	'CGA' => 'R',    # Arginine
	'CGC' => 'R',    # Arginine
	'CGG' => 'R',    # Arginine
	'CGT' => 'R',    # Arginine
	'CGN' => 'R',
	'ATA' => 'I',    # Isoleucine
	'ATC' => 'I',    # Isoleucine
	'ATT' => 'I',    # Isoleucine
	'ATG' => 'M',    # Methionine
	'ACA' => 'T',    # Threonine
	'ACC' => 'T',    # Threonine
	'ACG' => 'T',    # Threonine
	'ACT' => 'T',    # Threonine
	'ACN' => 'T',
	'AAC' => 'N',    # Asparagine
	'AAT' => 'N',    # Asparagine
	'AAA' => 'K',    # Lysine
	'AAG' => 'K',    # Lysine
	'AGC' => 'S',    # Serine
	'AGT' => 'S',    # Serine
	'AGA' => 'R',    # Arginine
	'AGG' => 'R',    # Arginine
	'GTA' => 'V',    # Valine
	'GTC' => 'V',    # Valine
	'GTG' => 'V',    # Valine
	'GTT' => 'V',    # Valine
	'GTN' => 'V',
	'GCA' => 'A',    # Alanine
	'GCC' => 'A',    # Alanine
	'GCG' => 'A',    # Alanine
	'GCT' => 'A',    # Alanine
	'GCN' => 'A',
	'GAC' => 'D',    # Aspartic Acid
	'GAT' => 'D',    # Aspartic Acid
	'GAA' => 'E',    # Glutamic Acid
	'GAG' => 'E',    # Glutamic Acid
	'GGA' => 'G',    # Glycine
	'GGC' => 'G',    # Glycine
	'GGG' => 'G',    # Glycine
	'GGT' => 'G',    # Glycine
	'GGN' => 'G',
	'MGR' => 'R',
	'AAY' => 'N',
	'GAY' => 'D',
	'TGY' => 'C',
	'CAR' => 'Q',
	'GAR' => 'E',
	'CAY' => 'H',
	'ATH' => 'I',
	'YTR' => 'L',
	'AAR' => 'K',
	'TTY' => 'F',
	'TCN' => 'S',
	'AGY' => 'S',
	'ACN' => 'T',
	'TAY' => 'Y',
	'TAR' => '*',
	'TRA' => '*',
	'---' => '-'
	);
    
    if (exists $genetic_code{$codon}) {
        return $genetic_code{$codon};
    } else {
	
	print STDERR "Bad codon \"$codon\"!!\n";
	return 'X';
	# exit;
    }
}

