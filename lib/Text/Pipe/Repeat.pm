package Text::Pipe::Repeat;

use warnings;
use strict;


our $VERSION = '0.03';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(times join));


use constant DEFAULTS => (
    times => 2,
    join  => '',
);


sub filter_single {
    my ($self, $input) = @_;
    my $output = '';

    # temp variables in case we have to loop many times, in which case
    # repeated trips to the accessors would be inefficient.

    my $times = $self->times;
    my $join  = $self->join;

    for (1 .. $times) {
        $output .= $input;
        $output .= $join unless $_ eq $times;
    }
    $output;
}


1;


__END__



=head1 NAME

Text::Pipe::Repeat - Common text filter API

=head1 SYNOPSIS

    Text::Pipe::Repeat->new;

=head1 DESCRIPTION

Text::Pipe::Repeat inherits from L<Text::Pipe::Base>.

=head1 METHODS

=over 4

=item clear_join

    $obj->clear_join;

Clears the value.

=item clear_times

    $obj->clear_times;

Clears the value.

=item join

    my $value = $obj->join;
    $obj->join($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item join_clear

    $obj->join_clear;

Clears the value.

=item times

    my $value = $obj->times;
    $obj->times($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item times_clear

    $obj->times_clear;

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

