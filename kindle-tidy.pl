#!/usr/bin/env perl

use strict;
use warnings;
use HTML::TreeBuilder;

my $root = HTML::TreeBuilder->new;
$root->parse_file(shift);

my @divs = $root->find_by_tag_name('div');

foreach my $div (@divs) {
  if ($div->attr_get_i('id') eq 'postamble') {
    $div->delete_content;
  }
}

my @tables = $root->find_by_tag_name('table');
foreach my $table (@tables) {
  $table->delete_content;
}

print $root->as_HTML;
$root->delete;
