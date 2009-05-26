package Perl::Critic::Policy::CodeLayout::ProhibitHashBarewords;

use strict;
use warnings;
use Perl::Critic::Utils;
use base 'Perl::Critic::Policy';

our $VERSION = '1.0';

my $desc = q{Hash key with bareword};

sub default_severity { return $SEVERITY_MEDIUM }
sub default_themes   { return qw(pbp danger) }
sub applies_to       { return 'PPI::Token::Word' }

sub violates {
    my ( $self, $elem ) = @_;

    #we only want the check hash keys
    return if !is_hash_key($elem);

    return if is_method_call($elem);
    return if is_subroutine_name($elem);
    return if is_function_call($elem);
    return if is_perl_builtin($elem);
    return if is_perl_global($elem);

    return $self->violation( $desc, ['n/a'], $elem );
    my $sib = $elem->snext_sibling();

    return unless $sib;
    return unless $sib->isa('PPI::Token::Number');
    return unless $sib =~ m/^\d+\z/;

    return $self->violation( $desc, ['n/a'], $elem );
}

1;

__END__

=pod

=head1 NAME

Perl::Critic::Policy::CodeLayout::ProhibitHashBarewords

=head1 AFFILIATION

This policy is part of L<Perl::Critic::Itch>.

=head1 VERSION

1.0

=head1 SYNOPSIS

Requires backticks on all hash keys barewords

=head1 DESCRIPTION

When using a bareword as a hash key, we should always use backtips to mode the code more legible.

Things as $my_elem{some_bareword} should be writen as $my_elem{'some_bareword'}


=head1 INTERFACE

Stadard for a L<Perl::Critic::Policy>.

=head1 DIAGNOSTICS

None.

