#!/usr/bin/env bash
dir=`dirname $0`
cd $dir
cd ..
root=`pwd`
docroot=$root/src/site
libroot=$root/lib/java/

export snarfjar=$libroot/avi-docs-snarfer-1.0.3-jar-with-dependencies.jar
