use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Perl::Critic::Itch',
    AUTHOR              => 'Marcelo Rodrigues <marcelo@cpan.org>',
    VERSION_FROM        => 'lib/Perl/Critic/Itch.pm',
    ABSTRACT            => 'Perl::Critic::Itch - A collection of Policies to solve some Itches',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Perl-Critic-Itch-*' },
);
