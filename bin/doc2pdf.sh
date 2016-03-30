#!/usr/bin/env bash

bin_dir=`dirname $0`
pushd $bin_dir > /dev/null
cd ..
base_dir=`pwd`
popd > /dev/null

base_url="http://localhost:4000"
version="16.1"
source_root="/docs/${version}"
dest_root="${base_dir}/src/site/docs/${version}"
echo "Dest root: < $dest_root >"
sources=("/configuration-guide/configuration-guide-single-page")
dests=("/configuration-guide/configuration-guide.pdf")
toc_xsl="${base_dir}/src/resources/toc.xsl"
toc="toc \
  --xsl-style-sheet ${toc_xsl}"
#toc=""

source_count=${#sources[@]}

for (( i=0; i<$source_count; i++ )); do
url="${base_url}/${source_root}/${sources[$i]}"
dest="${dest_root}/${dests[$i]}"
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
${toc} \
    ${url} ${dest}"
echo "cmd: $cmd"
$cmd
done
