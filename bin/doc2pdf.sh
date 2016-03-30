#!/usr/bin/env bash

bin_dir=`dirname $0`
pushd $bin_dir > /dev/null
cd ..
base_dir=`pwd`
popd > /dev/null

doc_version="16.1"

base_url="http://localhost:4000"
source_root="/docs/${doc_version}"
dest_root="${base_dir}/src/site/docs/${doc_version}"

names=("Avi Vantage Configuration Guide" "Avi Vantage DataScript Guide" "Avi Vantage CLI Guide")
sources=("/configuration-guide/configuration-guide-single-page" "/datascript-guide/datascript-guide-single-page" "/cli-guide/cli-guide-single-page")
dests=("/configuration-guide/configuration-guide.pdf" "/datascript-guide/datascript-guide.pdf" "/cli-guide/cli-guide.pdf")

toc_xsl="${base_dir}/src/resources/toc.xsl"

source_count=${#sources[@]}

for (( i=0; i<$source_count; i++ )); do
name="${names[$i]}"
url="${base_url}/${source_root}/${sources[$i]}"
dest="${dest_root}/${dests[$i]}"
tmp_xsl="/tmp/toc.xsl"

cp $toc_xsl $tmp_xsl
perl -p -i -e "s/__DOC__VERSION__/${doc_version}/g" $tmp_xsl
perl -p -i -e "s/__DOC_NAME__/${name}/g" $tmp_xsl

cmd="wkhtmltopdf \
  --outline \
  --outline-depth 2 \
  --page-size Letter \
  --footer-left [title] \
  --footer-center v${doc_version} \
  --footer-right [page]/[toPage] \
  --footer-font-size 8 \
  --footer-line \
  --footer-spacing 2 \
toc \
  --xsl-style-sheet ${tmp_xsl} \
    ${url} ${dest}"
echo "cmd: $cmd"
$cmd
done
