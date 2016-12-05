#!/usr/bin/env bash

idea="idea"

dir=`dirname $0`
cd $dir
dir=`pwd`

cd ../src/site/docs/
root=`pwd`

cd 16.3-changes
queue=`pwd`

dest=${root}/16.3/

echo "Root: $root"
echo "Queue: $queue"

for i in `find $queue -type f`; do
    destfile=${i/16.3-changes/16.3/}
    echo "Queue file: $i"
    echo "Dest file : $destfile"
    cmd="$idea diff $i $destfile"
    echo "command: $cmd"
    $cmd
    
    echo "Delete queue item and continue? [N|y] "
    read continue
    if [ "$continue" != "y" ]; then
        break
    fi
    # TODO: git rm the queue file
done