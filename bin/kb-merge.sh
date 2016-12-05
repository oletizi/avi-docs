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
    echo "=============================================================================="
    echo "Queue file: $i"
    echo "Dest file : $destfile"
    if [ ! -e $destfile ]; then
        # Ask if the file should be copied to the destination location
        echo "$desfile not found. Copy queue file there: $i"
        read response
        if [ "$response" == y ]; then
            cp $i $destfile
        fi
    elif [[ $i ==  *.png || $i == *.jpg || $i == *.jpeg || $i == *.gif  ]]; then
        # Handle image files
        echo "This is an image: $i"
        if [ "`diff $i $destfile`" != "" ]; then
            # there are differences between the two images
            echo "Difference between $i and $destfile"
            echo "Copy $i? [N|y]"
            read response
            if [ "$response" == y ]; then
                cp $i $destfile
            fi
         else
            echo "Images are identical. Nothing to do"
        fi
    elif [ "`diff $i $destfile`" != "" ]; then
        cmd="$idea diff $i $destfile"
        echo "command: $cmd"
        $cmd
    else
        echo "Files are identical. Nothing to do."
    fi
    echo "Delete queue item and continue? [N|y] "
    read continue
    if [ "$continue" != "y" ]; then
        break
    fi
    git rm $i
done
