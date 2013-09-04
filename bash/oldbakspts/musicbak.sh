#!/bin/bash

# Back up home directories 
#

#tar -zcf /sysbak/musicbak/musicbak.tgz /home/share/music
cd /home/share
tar -zcf musicbak.tgz music
mv musicbak.tgz /backup/sysbak/musicbak

