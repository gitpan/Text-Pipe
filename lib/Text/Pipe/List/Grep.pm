package Text::Pipe::List::Grep;

use warnings;
use strict;


our $VERSION = '0.03';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(code));


sub filter {
    my ($self, $input) = @_;
    return $input unless ref $input eq 'ARRAY';

    # kludge because of prototype requirements
    [ grep { $self->code->() } @$input ];
}


1;


__END__



=head1 NAME

Text::Pipe::List::Grep - Common text filter API

=head1 SYNOPSIS

    my $pipe = Text::Pipe->new('List::Grep', code => { $_ < 7 });
    my $result = $pipe->filter(...);

=head1 DESCRIPTION

Text::Pipe::List::Grep inherits from L<Text::Pipe::Base>.

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

