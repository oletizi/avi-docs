#!/usr/bin/env bash
dir=`dirname $0`
#cmd="$dir/clean.sh"
$cmd
cd $dir
cd ../src/site

options=""

if [ -e /mnt/c ]; then
 echo "I have a C:\ drive! I must be Windows! Using polling instead of watching..."
 options=" --force_polling"
fi

cmd="bundle exec jekyll serve --host=0.0.0.0 --incremental ${options}"
echo "Executing \"$cmd\" from `pwd`"
$cmd
