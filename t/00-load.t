#!/usr/bin/perl

use Test::More tests => 1;

diag(
  "Perl::Critic::Ithc $Perl::Critic::Policy::Itch::VERSION, Perl $],$^X"
);

BEGIN {
  use_ok(
    'Perl::Critic::Policy::CodeLayout::ProhibitHashBarewords'
  );
}


