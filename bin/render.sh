#!/usr/bin/env bash

cd `dirname $0`
cd ../src/site

cmd="bundle exec jekyll build"
echo "Executing \"$cmd\" from `pwd`"
$cmd