#!/bin/bash

# Back up home directories 
#

#tar -zcf /sysbak/repsolbak/repsolbak.tgz /home/repsol/

cd /home
tar -zcf repsolbak.tgz repsol
mv repsolbak.tgz /backup/sysbak/repsolbak

