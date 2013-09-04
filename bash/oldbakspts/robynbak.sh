#!/bin/bash

# Back up home directories 
#

#tar -zcf /sysbak/robynbak/robynbak.tgz /home/robyn/
cd /home
tar -zcf robynbak.tgz robyn
mv robynbak.tgz /backup/sysbak/robynbak


