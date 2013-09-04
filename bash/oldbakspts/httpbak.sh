#!/bin/bash

#this is going to tar up http files and save them in httpbak
#

cd /var
tar -zcf www.tgz www
mv www.tgz /backup/sysbak/httpbak

