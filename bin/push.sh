#!/usr/bin/env bash

mydir=`dirname $0`
cd $mydir
mydir=`pwd`
cd $mydir/../src/site/_site

prod1="ubuntu@unknown"
prod2="ubuntu@unknown"

ssh="ssh"
rsync="rsync"
options="-avh --delete --cvs-exclude"
destinations=""

if [ "dev"=$1 ]; then
    echo "Pushing to local development site: $1";
    destinations="${HOME}/.avi-docs-site/"
    if [ ! -e $destinations ]; then
        echo "Creating local dev site directory: ${destinations}"
        mkdir $destinations
    fi
else
    echo "Pushing to production"
    options=${options} . " -e \"${ssh}\""
    destinations="${prod1} ${prod2}"
fi

for dest in $destinations; do
    cmd="$rsync $options . $dest"
    echo "Executing from: " . `pwd`
    echo "CMD: ${cmd}"
done