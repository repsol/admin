#!/usr/bin/bash  

#This runs df -h and greps for /opt diskspace percentage
res=$(df -h | grep /opt | awk '{print $5}')
typeset -i var=${res%?}

#use this to test script
#echo ${var}
#var=96

#If /opt percentage is greater than 95 then send an email alert.
if [ ${var} -gt 95 ]
then
	echo "/opt = ${res} Better Clear Some Space on OOLPDB10!" | mailx mgaddick@apollogrp.edu 

fi

