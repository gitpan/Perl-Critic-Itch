package Perl::Critic::Policy::CodeLayout::ProhibitHashBarewords;

use strict;
use warnings;
use Perl::Critic::Utils;
use base 'Perl::Critic::Policy';

our $VERSION = '0.04';

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

0.04

=head1 DESCRIPTION

This Policy forces (single) quotes on all hash keys barewords.

When specifying constant string hash keys, you should use (single) quotes. E.g., $my_hash{'some_key'} 

I believe that this is the appropriate choice because it results in consistent formatting and if you forget to use quotes sometimes, you have to remember to add them when your key contains internal hyphens, spaces, or other special characters. 

Quoted keys are also more likely to be syntax-highlighted by your editor.



=head1 INTERFACE

Stadard for a L<Perl::Critic::Policy>.


