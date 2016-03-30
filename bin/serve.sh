#!/usr/bin/env bash

cd `dirname $0`
cd ../src/site

cmd="jekyll serve --incremental"
echo "Executing \"$cmd\" from `pwd`"
$cmd