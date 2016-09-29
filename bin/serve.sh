#!/usr/bin/env bash
dir=`dirname $0`
#cmd="$dir/clean.sh"
$cmd
cd $dir
cd ../src/site
cmd="bundle exec jekyll serve --host=0.0.0.0 --incremental"
echo "Executing \"$cmd\" from `pwd`"
$cmd