#!/bin/bash 

#Backup the server
#

#Declare variables!
a=`touch test /backup`
p=`echo $?`
dsk=`df -h | grep /backup | awk '{print $6}'`

#test $?
#p=23

#See if remote drive is writable!
if [ $p != 0 ]; then
	umount /backup
	sleep 10
	mount -a
	sleep 10
else
	`rm -rf test`

fi

#Is /backup mounted?

if [ "$dsk" == "/backup" ]; then
	#start the backup!
	rsync -aqz --delete /var/www /backup/httpbak
	
else

	echo Backups failed again | /bin/mail "repsol05@gmail.com"
fi
