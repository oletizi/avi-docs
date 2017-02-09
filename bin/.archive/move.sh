#!/usr/bin/env bash

dir=`dirname $0`
cd $dir
dir=`pwd`
. $dir/config.sh

class=com.avinetworks.docs.structure.Mover

cd $docroot

cmd="java -Ddocroot=$docroot -cp $snarfjar $class $1 $2"
#echo "docroot: $docroot"
#echo "cwd: " . `pwd`
echo "command: $cmd"
exec $cmd