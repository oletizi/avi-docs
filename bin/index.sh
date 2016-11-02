#!/usr/bin/env bash

cd `dirname $0`
bin=`pwd | xargs echo -n`
cd ..
root=`pwd | xargs echo -n`
cd ${root}/src/site

versions=`ls docs | grep '^[0-9]'`

echo "Versions: ${versions}"

for  i in $versions;
do
    i=`echo -n $i`
    echo "Indexing for version: <${i}>"

    cp ${root}/src/site/_config.yml /tmp/
    #${bin}/find-replace.pl -y --root=/tmp/ _config.yml "index_name:\s*'avi-docs'" "index_name:     '${i}'"
    export DOCS_VERSION=$i
    export ALGOLIA_INDEX_NAME=${i}
    bundle exec jekyll algolia push
done
