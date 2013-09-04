#!/bin/bash

# Back up books 
#

cd /home/share
tar -zcf booksbak.tgz books
mv booksbak.tgz /backup/sysbak/bookbak

