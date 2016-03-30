#!/usr/bin/env bash

cd `dirname $0`
cd ../src/site

cmd="jekyll build"
echo "Executing \"$cmd\" from `pwd`"
$cmd