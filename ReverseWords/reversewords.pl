#!/usr/bin/perl
# Notes:
# List::Utils first
# 
use Modern::Perl;
use List::Util qw(min);

my ( $input_filename ) = @ARGV;

say( STDERR "Reading: $input_filename..." );

open my $fh, "<", $input_filename;

my $line= <$fh>;
chomp $line;
my $n_cases = $line;

say STDERR "N: $n_cases";
for my $i (1..$n_cases) {
	say STDERR "Processing case $i";
	$line= <$fh>;
	chomp $line;
	my @words = split(/\W/, $line);
	my $result = join(" ", reverse @words);
	say "Case #${i}: ${result}";
}
close($fh);
