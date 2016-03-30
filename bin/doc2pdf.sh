#!/usr/bin/env bash

bin_dir=`dirname $0`
pushd $bin_dir > /dev/null
cd ..
base_dir=`pwd`
popd > /dev/null

base_url="http://localhost:4000"
version=16.1
sources="docs/${version}/configuration-guide/configuration-guide-single-page"
toc_xsl="${base_dir}/src/resources/toc.xsl"
for i in $sources; do
url="${base_url}/${i}"
dest="${base_dir}/src/site/${i}.pdf"
cmd="wkhtmltopdf \
  --outline \
  --outline-depth 2 \
  --page-size Letter \
  --footer-left [title] \
  --footer-center v${version} \
  --footer-right [page]/[toPage] \
  --footer-font-size 8 \
  --footer-line \
  --footer-spacing 2 \
toc \
  --xsl-style-sheet ${toc_xsl}
    ${url} ${dest}"
echo "cmd: $cmd"
$cmd
done
