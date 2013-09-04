#!/bin/bash

# Back up /etc
#

#tar -zcf /home/admin/sysbak/etcbak/etcbak.tgz /etc
cd /
tar -zcf etcbak.tgz etc
mv etcbak.tgz /backup/sysbak/etcbak

