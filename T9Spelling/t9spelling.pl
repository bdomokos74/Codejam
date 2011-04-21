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

my %keymap = (
	'a' , "2",
	'b' , "22",
	'c' , "222",
	'd' , "3",
	'e' , "33",
	'f' , "333",
	'g' , "4",
	'h' , "44",
	'i' , "444",
	'j' , "5",
	'k' , "55",
	'l' , "555",
	'm' , "6",
	'n' , "66",
	'o' , "666",
	'p' , "7",
	'q' , "77",
	'r' , "777",
	's' , "7777",
	't' , "8",
	'u' , "88",
	'v' , "888",
	'w' , "9",
	'x' , "99",
	'y' , "999",
	'z' , "9999",
	' ' , "0",
);

say STDERR "N: $n_cases";
for my $i (1..$n_cases) {
	say STDERR "Processing case $i";
	$line= <$fh>;
	chomp $line;
	my $text = $line;
	my $result = process_case($line);
	say "Case #${i}: ${result}";
}
close($fh);

sub process_case {
	my ($text) = @_;
	my $prev_digit = -1;
	my $result = "";
	my @letters = split(//, $text);
	for my $curr (@letters) {
		my $curr_keys = $keymap{$curr};
		my $curr_digit = substr $curr_keys, 0, 1;
		$result .= ' ' if($curr_digit == $prev_digit);
		$result .= $curr_keys;
		$prev_digit = $curr_digit;
	}
	return $result;
}