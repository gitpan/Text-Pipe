package Text::Pipe::Prepend;

use warnings;
use strict;


our $VERSION = '0.04';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(text));


sub filter_single {
    my ($self, $input) = @_;
    return $input unless defined $self->text;
    $self->text . $input;
}


1;


__END__



=head1 NAME

Text::Pipe::Prepend - Common text filter API

=head1 SYNOPSIS

    Text::Pipe::Prepend->new;

=head1 DESCRIPTION

Text::Pipe::Prepend inherits from L<Text::Pipe::Base>.

=head1 METHODS

=over 4

=item clear_text

    $obj->clear_text;

Clears the value.

=item text

    my $value = $obj->text;
    $obj->text($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item text_clear

    $obj->text_clear;

Clears the value.

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

