#!/usr/bin/perl -w

use strict;
use warnings;

while (<STDIN>) {
  my $filename = $_;
  chomp $filename;
  println( "filename: $filename" );
  open FILE, $filename or die "Can't open $filename for reading: $!";

  my @contents = ();
  while (<FILE>) {
    my $line = $_;
    my $outline = $line;

    my @urls = getUrls( $line );
    foreach (@urls) {
      my $url = $_;
      if (($url =~ /^http/ || $url =~ /\/wp-content/) && $url =~ /\.jpg|\.png/) {
        fetchImage( $url );
        my @chunks = split /\//, $url;
        my $imgName = pop @chunks;
        println( "swapping image: $imgName" );
        $outline =~ s|$url|img/$imgName|sg;
        println( "replaced:" );
        println( "  $line" );
        println( "  $outline" );
      }
    }
    push @contents, $outline;
  }
  close FILE;
  my $outfile = $filename.".tmp";
  open OUT, ">$outfile" or die "Can't open $outfile for writing: $!";
  foreach (@contents) {
    print OUT;
  }
  close OUT;
  my $cmd = "mv $outfile $filename";
  println( "moving updated file: $cmd" );
  `$cmd`;
}

sub fetchImage {
  my ($url) = @_;
  if ($url =~ /^\//) {
    $url = "http://kb.avinetworks.com".$url;
  }
  my $cmd = "wget -N $url";
  println( "Fetching img with command: $cmd" );
  `$cmd`;
}

sub getUrls {
  my ($line) = @_;
  my @rv = ();
  while($line =~ /<img.+?src="(.*?)"/g ) {
    println( "Found url: $1" );
    push @rv, $1;
  }
  while ($line =~ /^ \[.+\]: (.+)/g) {
    println ("Found indexed url: $1");
    push @rv, $1;
  }
  return @rv;
}

sub println {
  print shift."\n";
}
