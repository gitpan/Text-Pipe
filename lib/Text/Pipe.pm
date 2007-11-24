package Text::Pipe;

use strict;
use warnings;
use Text::Pipe::Base;   # for def_pipe()
use Sub::Name;
use UNIVERSAL::require;


our $VERSION = '0.05';


use base 'Exporter';


our %EXPORT_TAGS = (
    util  => [ qw(pipe) ],
);


our @EXPORT_OK = @{ $EXPORT_TAGS{all} = [ map { @$_ } values %EXPORT_TAGS ] };


# this is just a factory

sub new {
    my ($class, $type, @config) = @_;
    my $package = "Text::Pipe::$type";

    # Check; it might have been defined with def_pipe(), so ->require wouldn't
    # work.

    unless (UNIVERSAL::can($package, 'filter')) {
        $package->require or die $@;
    }

    $package->new(@config);
}   


sub def_pipe {
    my ($self, $name, $code) = @_;
    my $package = "Text::Pipe::$name";

    no strict 'refs';
    @{ "${package}::ISA" } = ('Text::Pipe::Base');
    *{ "${package}::filter" } = subname "${package}::filter" => $code;
}


# Easier, procedural, way to construct a pipe

sub pipe {
    my ($type, @args) = @_;
    Text::Pipe->new($type, @args);
}


1;


__END__



=head1 NAME

Text::Pipe - Common text filter API

=head1 SYNOPSIS

    my $pipe = Text::Pipe->new('List::First', code => { $_ < 7 });
    my $result = $pipe->filter(...);

=head1 DESCRIPTION

This class is a factory for text pipes. A pipe has a C<filter()> method
through which input can pass. The input can be a string or a reference to an
array of strings. Pipes can be stacked together using
L<Text::Pipe::Stackable>.

The problem that this distribution tries to solve is that there are several
distributions on CPAN which use text filtering in some way or other, for
example the Template Toolkit. But each distribution is somewhat different, and
they have to reimplement the same text filters over and over again. 

This distribution aims at offering a common text filter API. So if you want to
use text pipes with Template Toolkit, you just need to write an adapter.

Text pipe segments live in the C<Text::Pipe::> namespace. So if you implement
a C<Text::Pipe::Foo::Bar> pipe segment, you can instantiate it with

    my $pipe = Text::Pipe->new('Foo::Bar');

Some pipe segments take arguments. These are described in their respective
class documentations.

=head1 METHODS

=over 4



=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<textpipe> tag.

=head1 VERSION 
                   
This document describes version 0.05 of L<Text::Pipe>.

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

