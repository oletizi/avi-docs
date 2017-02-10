#!/bin/bash

cd `dirname $0`
. config.sh

bin=`pwd | xargs echo -n`
cd ..
root=`pwd | xargs echo -n`
cd ..
parent=`pwd | xargs echo -n`

echo "content git url: $content_git_url"
echo "content branches: $content_branches"

cloned=0;

for branch in $content_branches; do

    cd $parent
    clone_name="avi-docs-content-${branch}"
    clone_path="${parent}/${clone_name}"
    ## Make sure the content repo clone for this branch exists
    echo "Checking content clone: $clone_path"
    if [ ! -e $clone_path ]; then
        echo
        cmd="git clone $content_git_url $clone_name"
        echo "$clone_path doesn't exist."
        echo "Cloning it: <$cmd>"
        ($cmd)
    fi
    cd $clone_path
    ## TODO: Make sure the content repo clone has the proper remote
    cmd="git remote get-url --push origin"
    echo
    echo "Making sure the content repo origin is sane: <$cmd>"
    origin=$($cmd)
    echo "Origin is set to $origin"
    if [ ! $content_git_url == $origin ]; then

        echo
        cmd="git remote remove origin"

        echo "Content repo $clone_path is pointing to the wrong origin. Removing old origin: <$cmd>"
        (cmd)

        echo
        cmd="git remote add origin $content_git_url"

        echo "Adding new origin: <$cmd>"
        ($cmd)
    else
        echo
        echo "Origin looks good."
    fi

    ## Make sure the content repo clone is checked out to the proper branch
    echo
    cmd="git checkout $branch"
    echo "Checking out branch $branch in $clone_path: <$cmd>"
    ($cmd)

    ## Make sure the content repo clone is up to date
    echo
    cmd="git pull origin $branch"
    echo "Pulling latest content: <$cmd>"
    ($cmd)
done
