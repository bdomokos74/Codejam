#!/usr/bin/perl
# Notes:
# List::Utils first
# 
use Modern::Perl;
use List::Util qw(min);

my ( $input_filename ) = @ARGV;

say( STDERR "Reading: $input_filename..." );

open my $fh, "<", $input_filename;

my @lang = ();

my $line= <$fh>;
chomp $line;
my @params = split(/\s/, $line);
my $word_len = $params[0];
my $num_words = $params[1];
my $num_tests = $params[2];

for my $i (0..($num_words-1)) {
	$line= <$fh>;
	chomp $line;
	push @lang, $line;
}

for my $i (1..$num_tests) {
	say STDERR "Processing case $i";
	$line= <$fh>;
	chomp $line;
	my $result = process_case($word_len, \@lang, $line);
	say "Case #${i}: ${result}";
}
close($fh);

sub process_case {
	my ($word_len, $lang, $pattern) = @_;
	
	my $sum = 0;
	$pattern =~ tr/()/[]/;
	for my $word (@$lang) {
		$sum += 1 if( $word =~ $pattern);
	}
	return $sum;
}
