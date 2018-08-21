#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;

my ($input, $feature);

GetOptions('input|i:s' => \$input,
	   'feature|f:s' => \$feature);

my $input_fh = read_file($input);
my $total_count = 0;
my $total_length = 0;
while (<$input_fh>) {
    chomp;
    /^#/ and next;
    /^\s*$/ and next;
    my @line = split /\t/, $_;
    my ($type, $start, $end) = ($line[2], $line[3], $line[4]);
    my $length;
    #if (($type =~ /$feature$/) and ($_ !~ /ps/)) {
     if (($type =~ /$feature/) and ($_ !~ /ps/)) {
	#if ($type eq $feature) {
	if ($end < $start) {
	    print "warning: start > end!\n";
	    ($start, $end) = ($end, $start);
	}
	$length = $end - $start + 1;
	$total_length += $length;
	$total_count++;
    }
}
print "total_count: $total_count\n";
print "total_length: $total_length\n";

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


