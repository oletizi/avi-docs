#!/usr/bin/env bash
host=docs.avinetworks.com
outdir=/tmp/linklint
if [ -e $outdir ]; then
  echo "Removing old linklint report directory: $outdir"
  rm -rf $outdir
fi

mkdir $outdir

linklint -http -host $host -limit 1000 -doc $outdir /@

~/bin/linkcheck_report.sh