#!perl
use strict;
use warnings;
use ExtUtils::MakeMaker;


WriteMakefile(
    NAME                => 'Perl::Critic::Itch',
    AUTHOR              => 'Marcelo Rodrigues <marcelo@cpan.org>',
    VERSION_FROM        => 'lib/Perl/Critic/Itch.pm',
    ABSTRACT            => 'Perl::Critic::Itch - A remedy for some stuff that causes me Itches',
    PL_FILES            => {},
    PREREQ_PM => {
        'Perl::Critic' => 1.07,
        'Test::More' => 0,
    },
    LICENSE             => 'perl',

    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Perl-Critic-Itches-*' },
);


