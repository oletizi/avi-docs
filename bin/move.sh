#!/usr/bin/env bash


dir=`dirname $0`
cd $dir
cd ..
root=`pwd`
docroot=$root/src/site
libroot=$root/lib/java/

jar=$libroot/avi-docs-snarfer-1.0.1-jar-with-dependencies.jar
class=com.avinetworks.docs.Mover

cd $docroot

cmd="java -Ddocroot=$docroot -cp $jar $class $1 $2"
#echo "docroot: $docroot"
#echo "cwd: " . `pwd`
#echo "command: $cmd"
exec $cmd