#!/usr/bin/env bash

cd `dirname $0`
cd ../src/site

cmd="jekyll serve --host=0.0.0.0 --incremental"
echo "Executing \"$cmd\" from `pwd`"
$cmd