#!/usr/bin/env bash

cmd="wkhtmltopdf --page-size Letter --footer-left [title] --footer-right [webpage] --footer-font-size 8 --footer-line $1 $2"
echo "cmd: $cmd"
$cmd