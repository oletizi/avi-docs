#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use FindBin qw($Bin);
use File::Temp qw/ tempfile tempdir /;


if (scalar @ARGV < 2) {
    print usage();
    exit(1);
}

my ($sdk_branch, $docs_branch) = @ARGV;

my $docs =  $Bin . "/../src/site/docs/" . $docs_branch . "/api-guide/";


if (! -e $docs) {
    println("No such directory: $docs");
    exit(1);
}

chdir $docs;
$docs = `pwd`;
chomp($docs);

my $tmpdir = tempdir( CLEANUP => 1 );
chdir $tmpdir;

`git clone https://github.com/avinetworks/sdk.git`;

chdir "sdk";

`git checkout $sdk_branch`;

println("Moving to docs directory: $docs");
chdir $docs;

my $cmd = "cd $tmpdir/sdk/doc; tar cfv - . | (cd $docs; tar xf -)";
println("Executing $cmd");
system($cmd);

println("Done. Cleaning up...");

sub usage {
    return "\nupdate-api-guide.pl -- Update the API guide in the Avi Docs based on the latest from GitHub.\n\n"
        ."Usage:\n\n"
        ."\tupdate-api-guide.pl <sdk-branch> <docs-branch>\n\n"
    ;
}

sub println {
    print shift . "\n"
}