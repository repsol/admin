#!/bin/perl -x

#Backup the server
#

#See if remote drive is writable!
a=`touch test /backup`
#p=`echo $?`
p=23
if [ $p != 0 ]; then
	umount /backup
	sleep 10
	mount -a
	sleep 10
else
	`rm -rf test`

fi

#start the backup!
rsync -aqz --delete /var/www /backup/httpbak
	
