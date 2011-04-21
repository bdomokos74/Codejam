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
	my $credit = $line;
	$line= <$fh>;
	chomp $line;
	my $n_items = $line;
	$line= <$fh>;
	chomp $line;
	my @items = split(/\W/, $line);
	my ($a, $b) = process_case($credit, $n_items, \@items);
	say "Case #${i}: ${a} ${b}";
}
close($fh);

sub process_case {
	my ($credit, $n_items, $items) = @_;
	my $start = 0;
	my $end = $n_items-1;
	my $i=$start;
	my $j=$i+1;
	my $minvalue = min @$items;
	OUTER:
	while( $i < $end ) {
		if($items->[$i]+$minvalue > $credit) {
			$i++;
			$j=$i+1;
			next;
		}
		while( $j <= $end ) {
			if(($items->[$i]+$items->[$j]) == $credit) {
				last OUTER;
			} 
			$j++;
		}
		$i++;
		$j=$i+1;
	}
	return ($i+1, $j+1);
}

