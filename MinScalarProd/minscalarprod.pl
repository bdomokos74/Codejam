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
	my $n = $line;
	$line= <$fh>;
	chomp $line;
	my @vec_a = split(/\s/, $line);
	$line= <$fh>;
	chomp $line;
	my @vec_b = split(/\s/, $line);
	my $result = process_case($n, \@vec_a, \@vec_b);
	say "Case #${i}: ${result}";
}
close($fh);

sub process_case {
	my ($n, $vec_a, $vec_b) = @_;
	my @sorted_a = sort { $a <=> $b } @$vec_a;
	my @sorted_b = sort { $b <=> $a } @$vec_b;
	my $result = 0;
	for my $i (0..($n-1)) {
		$result += $sorted_a[$i] * $sorted_b[$i];
	}
	return $result;
}
