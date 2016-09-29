#!/usr/bin/env bash

logdir=/tmp/linklint
tarball=/tmp/linklint.tgz
recipients="orion@avinetworks.com" #nathan@avinetworks.com dang@avinetworks.com"

if grep ERROR $logdir/log.txt; then
    cd /tmp
    tar cfz linklint.tgz linklint
    echo "See attached linklint logs" | mutt -a /tmp/linklint.tgz -s 'kb.avinetworks.com linklint results ERRORS' -- $recipients
else
    echo "Linklint reports no errors" | mutt -s 'kb.avinetworks.com linklint results OK' -- $recipients
fi