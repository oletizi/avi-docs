#!/usr/bin/env bash

mydir=`dirname $0`
cd $mydir
mydir=`pwd`

$mydir/render.sh

cd $mydir/../src/site/_site

prod1="ubuntu@docs:/var/www/html/"

ssh="ssh"
rsync="rsync"
options="-avh --delete --cvs-exclude"
destinations="${prod1} ${prod2}"

if [ -z $1 ]; then
    echo "Pushing to production"
    options="-e ${ssh} ${options}"
elif [ "local" = $1 ]; then
    destinations="${HOME}/.avi-docs-site/"
    echo "Pushing to local site: ${destination}";
    if [ ! -e $destinations ]; then
        echo "Creating local dev site directory: ${destinations}"
        mkdir $destinations
    fi
else
    echo "Usage:"
    echo ""
    echo "  push.sh [dev]"
    exit
fi

for dest in $destinations; do
    cmd="$rsync $options . $dest"
    echo "Executing from: " . `pwd`
    echo "CMD: ${cmd}"
    exec ${cmd}
done