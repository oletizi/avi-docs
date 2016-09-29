#!/usr/bin/env bash

mydir=`dirname $0`
cd $mydir
mydir=`pwd`
cd $mydir/../src/site/_site

prod1="ubuntu@unknown:/path/to/document/root/"
prod2="ubuntu@unknown:/path/to/document/root/"

ssh="ssh"
rsync="rsync"
options="-avh --delete --cvs-exclude"
destinations=""

if [ -z $1 ]; then
    echo "Pushing to production"
    options="${options} -e \"${ssh}\""
    destinations="${prod1} ${prod2}"
elif [ "dev" = $1 ]; then
    echo "Pushing to local development site: $1";
    destinations="${HOME}/.avi-docs-site/"
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
    $cmd
done