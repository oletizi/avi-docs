#!/usr/bin/env bash

cmd="wkhtmltopdf --page-size Letter --footer-left [title] --footer-right [webpage] --footer-font-size 8 --footer-line $*"
echo "cmd: $cmd"
$cmd