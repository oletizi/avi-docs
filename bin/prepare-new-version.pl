#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use FindBin qw($Bin);
use lib "$Bin/../lib/perl";
use IO::Output qw(println);

chdir "$Bin/../src/site/docs";
my $root = `pwd`;
chomp($root);


if (scalar @ARGV < 1) {
    println("Please specify the new branch name.");
    exit(1);
}
my ($newversion) = @ARGV;
my $target = "$root/$newversion";
my $latest = "$root/latest";

if (-e $target) {
    println("Target already exists. Please remove it: ".$target);
    exit(1);
}

if (!-e "$root/latest") {
    println("Please point a symbolic link called 'latest' at the latest docs version here: $root");
    exit(1);
}

mkdir $target;
if (! -d $target) {
    println("Unable to create target: $target");
    exit(1);
}

my $cmd = "cd $latest; tar cfv - . | (cd $target; tar xf -)";

println();
println("Going to create a new version ($newversion) from latest: \n\n\t$latest\n");
println("Executing: $cmd");

`$cmd`;

