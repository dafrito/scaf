package @CLASS@;
require Exporter;

our @ISA     = qw(Exporter);
our @EXPORT  = qw(hello_world);
our @VERSION = 1.00;

sub new {
    shift;
    my $self = {};

    # TODO Insert your constructor here

    return bless $self;
}

sub hello_world {
    my $self = shift;

    print "Hello from @CLASS@!\n";
};

1;
