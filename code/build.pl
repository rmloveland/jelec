#!/usr/bin/env perl

use strict;
use warnings;

# FIXME: This code doesn't actually work. I need to figure out how to call
# Emacs in batch mode via Perl. It works fine from the command line.

my $bookfile = shift or die "I need an argument, please!\n";
my $output = qx[emacs $bookfile -batch -eval '(org-export-as-html :pubdir "../tmp")'];
