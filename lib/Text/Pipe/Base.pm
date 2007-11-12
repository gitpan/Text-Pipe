package Text::Pipe::Base;

use warnings;
use strict;
use UNIVERSAL::require;
    

our $VERSION = '0.02';


use base 'Class::Accessor::Complex';

    
use overload '|' => 'bit_or';


__PACKAGE__->mk_new;


sub filter_single {
    my ($self, $input) = @_;
    $input;
}


sub filter {
    my ($self, $input) = @_;

    if (ref $input eq 'ARRAY') {
        return [ map { $self->filter_single($_) } @$input ];
    } else {
        return $self->filter_single($input);
    }

}



sub bit_or {
    my ($lhs, $rhs) = @_;

    die "can only stack pipe segments" unless
        UNIVERSAL::isa($lhs, 'Text::Pipe::Base') &&
        UNIVERSAL::isa($rhs, 'Text::Pipe::Base');
    
    # even if either side is a Text::Pipe::Stackable already, don't push or
    # unshift because we don't want to alter the original pipes. So we'd
    # rather create nested pipes.

    # don't use() it because Text::Pipe::Stackable inherits from this class
    Text::Pipe::Stackable->require;
    Text::Pipe::Stackable->new($lhs, $rhs);
}


1;


__END__



=head1 NAME

Text::Pipe::Base - Base class for text pipe segments

=head1 SYNOPSIS

    package Text::Pipe::My::Segment;

    use base 'Text::Pipe::Base'

    sub filter { ... }

=head1 DESCRIPTION

This is the base class for all text pipe segments. It implements basic
behaviour that specific text pipe segments will want to override.

It also overloads the C<|> operator so you can create stackable pipes like
this:

    my $stackable_pipe = $pipe1 | $pipe2 | $pipe3;

Text::Pipe::Base inherits from L<Class::Accessor::Complex>.

=head1 METHODS

=over 4

=item new

    Text::Pipe::Base->new;
    Text::Pipe::Base->new(%args);

A constructor. It can take named arguments which are used to set the object's
accessors.

=item filter_single

Filters a single string. In this base class this method just returns the input
string unaltered.

=item filter

Can filter a single string or an reference to an array of strings. Each string
is filtered using C<filter_single()>.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<textpipe> tag.

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

