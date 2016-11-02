#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Curses::UI;
use FindBin qw($Bin);
use lib "$Bin/../lib/perl";
use IO::Output qw(println);
use File::Temp qw/ tempfile /;

my $docroot = "$Bin/../src/site";
chdir $docroot;
$docroot = `pwd`;
chomp $docroot;

my $interactive = 1;

my @opts;
my @params;

foreach my $opt (@ARGV) {
    if ($opt =~ /^-/) {
        push @opts, $opt;
    } else {
        push @params, $opt;
    }
}

foreach my $opt (@opts) {
    if ($opt =~ /--root=/) {
        # specifying a different docroot
        $docroot = (split /=/, $opt)[1];
    }
    if ($opt eq '-y') {
        $interactive = 0;
    }
}

my ($filepattern, $searchpattern, $replacement) = @params;

my %matchfiles;

foreach my $pathname (`find $docroot -print`) {
    chomp $pathname;
    if ($pathname =~ /$filepattern/i) {
        if (defined $searchpattern) {
            searchInFile($pathname, $searchpattern);
        } else {
            # nothing to do but print the pathname
            println("$pathname");
        }
    }
}

my $output;
foreach my $file (sort keys %matchfiles) {
    my $matches = $matchfiles{$file};
    println(bold("File: $file"));
    println("Matches $searchpattern:\n$matches");
    if (defined $replacement) {
        my $preview = $matches;
        my $replacement_display = bold($replacement);
        $preview =~ s/$searchpattern/$replacement_display/igm;
        println("Preview:\n$preview")
    }
    my $answer;
    if ($interactive) {
        print ( "Replace (Y|n)?: " );
        $answer = <STDIN>;
    } else {
        $answer = 'y';
    }
    if ($answer =~ /^n/) {
        println("Skipping...");
    } else {
        println("Replacing...");
        replaceInFile($file, $searchpattern, $replacement);
        println("Done.");
    }
    println("=================================");
}

flush();

sub replaceInFile {
    my ($file, $pattern, $replace) = @_;
    open my $fh, $file or die "Can't open file for reading: $!";
    my ($tmpout, $tmpname) = tempfile();
    while (<$fh>) {
        $_ =~ s/$pattern/$replace/gi;
        print $tmpout $_;
    }
    close $fh;
    println("Replaced: $tmpname");
    my $cmd = "cp $tmpname $file";
    println("Swap: $cmd");
    execute($cmd);
}

sub searchInFile {
    my ($pathname, $pattern) = @_;
    my $matches;
    open my $fh, $pathname or die "Can't open $pathname for reading";
    while (<$fh>) {
        my $line = $_;
        if ($line =~ /($pattern)/igm) {
            my $emboldened = bold($1);
            $line =~ s/$pattern/$emboldened/igm;
            $matches .= $line;
        }
    }
    close $fh;
    if ($matches) {
        $matchfiles{$pathname} = $matches;
    }
}

sub bold {
    my ($element) = @_;
    return "\033[1m".$element."\033[0m";
}

sub flush {
    #print $output;
}

sub execute {
    system(shift);
    if ($? == -1) {
        print "failed to execute: $!\n";
    }
    elsif ($? & 127) {
        printf "child died with signal %d, %s coredump\n",
            ($? & 127), ($? & 128) ? 'with' : 'without';
    }
    else {
        printf "child exited with value %d\n", $? >> 8;
    }
}