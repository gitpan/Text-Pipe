package Text::Pipe::Split;

use warnings;
use strict;


our $VERSION = '0.02';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(pattern limit));


sub filter {
    my ($self, $input) = @_;

    return $input if ref $input;

    my $pattern = $self->pattern;
    $pattern = '' unless defined $pattern;

    my $limit = $self->limit;
    $limit = 0 unless defined $limit;

    [ split /$pattern/ => $input, $limit ];
}


1;


__END__



=head1 NAME

Text::Pipe::Split - Common text filter API

=head1 SYNOPSIS

    Text::Pipe::Split->new;

=head1 DESCRIPTION

This pipe segment can split a string along a pattern into an array. It works
like perl's C<split()>.

Text::Pipe::Split inherits from L<Text::Pipe::Base>.

Methods inherited from L<Text::Pipe::Base>:

     new()

=head1 METHODS

=over 4

=item clear_limit

    $obj->clear_limit;

Clears the value.

=item clear_pattern

    $obj->clear_pattern;

Clears the value.

=item limit

    my $value = $obj->limit;
    $obj->limit($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item limit_clear

    $obj->limit_clear;

Clears the value.

=item pattern

    my $value = $obj->pattern;
    $obj->pattern($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item pattern_clear

    $obj->pattern_clear;

Clears the value.

=item filter

Takes a string input and splits it along the pattern, respecting the limit
like perl's C<split()> function.

If something else than a string is passed, it is returned unchanged.

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

