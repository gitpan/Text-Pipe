package Text::Pipe::List::First;

use warnings;
use strict;
use List::Util 'first';


our $VERSION = '0.05';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(code));


sub filter {
    my ($self, $input) = @_;
    return $input unless ref $input eq 'ARRAY';

    # kludge because of prototype requirements
    first { $self->code->() } @$input;
}


1;


__END__



=head1 NAME

Text::Pipe::List::First - Common text filter API

=head1 SYNOPSIS

    my $pipe = Text::Pipe->new('List::First', code => { $_ < 7 });
    my $result = $pipe->filter(...);

=head1 DESCRIPTION

Text::Pipe::List::First inherits from L<Text::Pipe::Base>.

The superclass L<Text::Pipe::Base> defines these methods and functions:

    new(), ()(), (|(), bit_or(), filter_single(), init()

The superclass L<Class::Accessor::Complex> defines these methods and
functions:

    carp(), cluck(), croak(), flatten(), mk_abstract_accessors(),
    mk_array_accessors(), mk_boolean_accessors(),
    mk_class_array_accessors(), mk_class_hash_accessors(),
    mk_class_scalar_accessors(), mk_concat_accessors(),
    mk_forward_accessors(), mk_hash_accessors(), mk_integer_accessors(),
    mk_new(), mk_object_accessors(), mk_scalar_accessors(),
    mk_set_accessors(), mk_singleton()

The superclass L<Class::Accessor> defines these methods and functions:

    _carp(), _croak(), _mk_accessors(), accessor_name_for(),
    best_practice_accessor_name_for(), best_practice_mutator_name_for(),
    follow_best_practice(), get(), make_accessor(), make_ro_accessor(),
    make_wo_accessor(), mk_accessors(), mk_ro_accessors(),
    mk_wo_accessors(), mutator_name_for(), set()

The superclass L<Class::Accessor::Installer> defines these methods and
functions:

    install_accessor(), subname()

The superclass L<Class::Accessor::Constructor> defines these methods and
functions:

    NO_DIRTY(), WITH_DIRTY(), _make_constructor(), mk_constructor(),
    mk_constructor_with_dirty(), mk_singleton_constructor()

The superclass L<Data::Inherited> defines these methods and functions:

    every_hash(), every_list(), flush_every_cache_by_key()

The superclass L<Class::Accessor::Constructor::Base> defines these methods
and functions:

    HYGIENIC(), STORE(), clear_dirty(), clear_hygienic(),
    clear_unhygienic(), contains_hygienic(), contains_unhygienic(),
    delete_hygienic(), delete_unhygienic(), dirty(), dirty_clear(),
    dirty_set(), elements_hygienic(), elements_unhygienic(), hygienic(),
    hygienic_clear(), hygienic_contains(), hygienic_delete(),
    hygienic_elements(), hygienic_insert(), hygienic_is_empty(),
    hygienic_size(), insert_hygienic(), insert_unhygienic(),
    is_empty_hygienic(), is_empty_unhygienic(), set_dirty(),
    size_hygienic(), size_unhygienic(), unhygienic(), unhygienic_clear(),
    unhygienic_contains(), unhygienic_delete(), unhygienic_elements(),
    unhygienic_insert(), unhygienic_is_empty(), unhygienic_size()

The superclass L<Tie::StdHash> defines these methods and functions:

    CLEAR(), DELETE(), EXISTS(), FETCH(), FIRSTKEY(), NEXTKEY(), SCALAR(),
    TIEHASH()

=head1 METHODS

=over 4

=item clear_code

    $obj->clear_code;

Clears the value.

=item code

    my $value = $obj->code;
    $obj->code($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item code_clear

    $obj->code_clear;

Clears the value.

=item filter

If the input is an array reference, it passes each element to the code
reference. The element will be in C<$_>. Returns the first element for which
the code reference returns a true value.

If the input is a single string, it just returns that string. This is
semantically correct - if there is only one string, it has to be the first one
as well.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<textpipe> tag.

=head1 VERSION 
                   
This document describes version 0.05 of L<Text::Pipe::List::First>.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-text-pipe@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut
