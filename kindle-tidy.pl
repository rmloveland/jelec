#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
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

my @paras = $root->find_by_tag_name('p');
foreach my $para (@paras) {
  my @children = $para->content_list;
  for my $child (@children) {
    if ($child =~ /Figure \d+/i) {
      $para->delete_content;
    }
  }
}

print $root->as_HTML;
$root->delete;
