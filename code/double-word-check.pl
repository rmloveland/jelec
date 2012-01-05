#!/usr/bin/env perl

use strict;
use warnings;

while(<>) {
  print if /([a-z]+)\b\1/;
}
