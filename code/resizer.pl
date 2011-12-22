#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
use autodie;
use File::Copy;

my $percentage = shift || '50%';
my $image_dir = 'img';
my $image_type = 'jpg';

chdir $image_dir;
my @images = grep /^\d+/, <*.$image_type>;

for my $image (@images) {
  my $backup = "$image.bak";
  copy $image, $backup;
  system qq[C:/cygwin/bin/convert.exe -resize $percentage -verbose "$backup" "$image"];
}
