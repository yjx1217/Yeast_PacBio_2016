#!/usr/bin/perl
use warnings;
use strict;

my @strain = qw(S288C DBVPG6044 DBVPG6765 SK1 Y12 YPS128 UWOPS03-461.4 CBS432 N44 YPS138 UFRJ50816 UWOPS919171);

print "|---\n";
print "|Species|Strain|Assembly|Annotation|CDSs|Proteome\n";

my $i = 0;
my @links = ();
foreach my $strain (@strain) {
    print "|:-:|:-:|:-:|:-:|:-:|:-:\n";
    print "|*S.c.*|$strain|[GENOME][", $i+1, "]|[GFF][", $i+2, "]|[CDS][", $i+3, "]|[PEP][", $i+4,"]\n";
    $i += 4;

}
print "|---\n";

print "\n\n";
exit;
my $j = 0;
my $base_path = "/Users/yjx/Dropbox/PacBio_Final";
my @class_path = qw(Nuclear_Genome Nuclear_GFF Nuclear_CDS Nuclear_PEP);
my @suffix = qw(genome.fa.gz all_feature.gff.gz cds.fa.gz pep.fa.gz);    
foreach my $strain (@strain) {
    foreach my $suffix (@suffix) {
	$j++;
	my $k = ($j-1) % 4;
	my $full_path = "$base_path/$class_path[$k]/$strain.$suffix";
	print "[$j]: $full_path\n";
    }
}



$j = 48;

@class_path = qw(Mito_Genome Mito_GFF Mito_CDS Mito_PEP);

foreach my $strain (@strain) {
    foreach my $suffix (@suffix) {
	$j++;
	my $k = ($j-1) % 4;
	my $full_path = "$base_path/$class_path[$k]/$strain.$suffix";
	print "[$j]: $full_path\n";
    }
}
