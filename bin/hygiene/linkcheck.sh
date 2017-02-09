#!/usr/bin/env bash
host=docs.avinetworks.dev
#host=localhost:4000
outdir=/tmp/linklint
if [ -e $outdir ]; then
  echo "Removing old linklint report directory: $outdir"
  rm -rf $outdir
fi

mkdir $outdir

linklint -http -host $host -limit 1000 -doc $outdir /@