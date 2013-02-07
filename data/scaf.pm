#!/usr/bin/perl
package @CLASS@;

use strict;
use warnings;

use Carp;

require Exporter;

our @ISA     = qw(Exporter);
our @EXPORT  = qw();
our $VERSION = 1.00;

sub new {
    my $class = shift;
    my $self = {};

    # TODO Insert your constructor here

    return bless($self, $class);
}

sub hello_world {
    my $self = shift;

    print "Hello from @CLASS@!\n";
};

1;
