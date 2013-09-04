#!/bin/bash 

#Backup the server
#

#See if remote drive is writable!
cd /backup
a=`touch test`
if [ -f test ]; then
	`rm -rf test`
else
	`umount /backup`
	`mount -a`

fi

#start the backup!
rsync -aqz --delete /var/spool/cron /backup/cronbak

	
