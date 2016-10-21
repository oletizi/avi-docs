package IO::Output;
use warnings FATAL => 'all';
use strict;
use Exporter qw(import);

our @EXPORT_OK = qw(println);

sub println {
    if (scalar @_ > 0) {
        print shift."\n";
    } else {
        print "\n";
    }
}

1;