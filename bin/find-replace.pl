#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Curses::UI;
use FindBin qw($Bin);

my $docroot = "$Bin/../src/site";
chdir $docroot;
$docroot = `pwd`;
chomp $docroot;

my ($filepattern, $searchpattern, $replacement) = @ARGV;

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
    println("=================================");
}

flush();

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

sub println {
    my ($line) = @_;
    if (defined $line) {
        #$output .= $line."\n";
        print $line."\n";
    }

}

sub flush {
    #print $output;
}