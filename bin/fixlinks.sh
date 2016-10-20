#!/usr/bin/env bash

dir=`dirname $0`
cd $dir
dir=`pwd`;
cd ..
root=`pwd`
docroot=$root/src/site
libroot=$root/lib/java/

$dir/find-replace.pl 'docs/16.2.2/(?!architectural-overview)(?!api-guide)(?!cli-guide)(?!configuration-guide)(?!installation-guide).*\.md' 'href="(?!img)(?!/docs/)(?!http)(?!#)(?!mailto)(?!/")' 'href="/docs/16.2.2/'
