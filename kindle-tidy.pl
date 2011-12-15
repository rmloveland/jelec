#!/usr/bin/env perl

use strict;
use warnings;
use HTML::TreeBuilder;

my $root = HTML::TreeBuilder->new;
$root->parse_file(shift);

foreach my $div ($root->find_by_tag_name('div')) {
  if ($div->attr_get_i('id') eq 'postamble') {
    $div->unshift_content('<!-- ');
    $div->push_content(' -->');
  }
}

print $root->as_HTML;
