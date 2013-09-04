#!/bin/bash

# tar up /home/admin/ send to sysbak in the respective folder
#

cd /home
tar -zcf admin.tgz admin 
mv admin.tgz /backup/sysbak/adminbak


