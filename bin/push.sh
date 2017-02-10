#!/usr/bin/env bash

mydir=`dirname $0`
cd $mydir
mydir=`pwd`

## For now, there is no need to push things, since they are served in place.
## --Orion Feb 10, 2017
$mydir/render.sh


#ssh="ssh"
#rsync="rsync"
#options="-avh --delete --cvs-exclude"
#if [ -z $1 ]; then
#    echo "No destinations specified. Doing nothing."
#else
#    $mydir/render.sh
#    cd $mydir/../src/site/_site
#    for dest in "$@"; do
#        cmd="$rsync $options . $dest"
#        echo "Executing from: " . `pwd`
#        echo "CMD: ${cmd}"
#        exec ${cmd}
#    done
#fi