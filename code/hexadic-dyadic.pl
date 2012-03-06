#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use Getopt::Long;
# TODO: rewrite to accept a stream on STDIN.

my ($base, $verbose);
GetOptions(
  'verbose' => \$verbose,
  'base=i'  => \$base
);

die "You must specify a number base" unless defined $base;
while (<>) {
  my $answer = convert_base($_, $base);
  print $_ if defined $verbose;
  print $answer, "\n";
}

sub convert_base {
  ## Int Int -> Str
  my ($n, $base) = @_;
  my @answer;

  while ( $n > 0 ) {
    push @answer, $n % $base;
    $n = int($n / $base);
  }

  my %lt = (
    10 => 'A',
    11 => 'B',
    12 => 'C',
    13 => 'D',
    14 => 'E',
    15 => 'F',
  );

  if ($base == 16) {
    for (@answer) {
      $_ = $lt{$_} if $lt{$_};
    }
    push @answer, '0x';
  }

  my $answer = join('', reverse @answer);
}

