#!/usr/bin/env bash

dir=`dirname $0`
cd $dir
dir=`pwd`
. $dir/config.sh

class=com.avinetworks.docs.crawler.Crawler

cd $docroot

if [ if -z $1 ]; then
    source="kb.avinetworks.com"
else
    source=$1
fi

cmd="java -Ddocroot=$docroot -cp $snarfjar $class $source"
#echo "docroot: $docroot"
#echo "cwd: " . `pwd`
echo "command: $cmd"
exec $cmd
