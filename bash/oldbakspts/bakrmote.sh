#!/bin/bash

P=`ping 192.168.1.199 -c 2| grep ttl` 
E=`echo $?`

#Testing True or False
#echo $E

if [ $E -eq 0 ]; then

#Testing the ping results
#echo $P

#Take away the "q" option to log to console
rsync -aqvz /sysbak/ root@192.168.1.199:/ntfs-3g/

#Space if needed for testing
#printf "\n"

elif [ $E -eq 1 ]; then 
echo "backups failed `date`" |`/bin/mail -s "Backup Failure!" "azexptech@gmail.com"`

fi
