#!/bin/bash 

#This script was written by Mike Addicks 5/18/11
#This purpose is to check for my public IP and if 
#it changes send me an email with the new IP 

#Declare variables
text='/home/admin/text/myip.txt'
EMAIL=azexptech@gmail.com


#This script will get my public IP then email it to me at a GMAIL account
IP=`wget http://findmyip.org -O - -o /dev/null | grep '<span class="title">Your' |awk '{print $6}' |cut -d "<" -f 1`

#Test
#echo $IP

#Check the $text list for the last IP on the list
tres=`cat $text |tail -n 1`

#Test
#echo $tres

#Here we test that the last IP on the list in $text is 
#the same or different than the actual public IP
#If it is not equal it appends the new IP to the list and
#sends an email with the new IP

	if [ "$IP" != "$tres" ]
	then
		echo $IP >> $text
		BODY="Your IP address has been changed to $IP!"
		echo $BODY |/bin/mail -s $IP "repsol05@gmail.com"
	fi
