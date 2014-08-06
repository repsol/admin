#!/bin/bash
############ 
#
#This script is to monitor the temp of the rasp
#
#Written by Acid Child 7/10/14
#
#
############

#Main
#Lets get the temp and strip off the junk
TEMP=$( /opt/vc/bin/vcgencmd measure_temp |cut -d '=' -f 2|cut -d "." -f 1 )
	#Test output
        #echo "${TEMP}"

#Now lets convert it to Fah 
FAH=$( echo "${TEMP}"*1.8+32 | bc )
	#test output
	echo $( date )
	echo "${FAH}" Fahrenheit 

#Strip the dot for comparison then put it back on for the output
if [ "${FAH%%\.*}" -ge '160' ] ; then
#if [ "${FAH%%\.*}" -ge '140' ] ; then

	echo The temp is "${FAH}"
	echo The RaspberryPi temperature is "${FAH}" | mail -s 'RaspberryPi is Hot!' "repsol05@gmail.com"

fi


