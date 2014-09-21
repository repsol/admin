#!/usr/bin/env python
#########################
#
# This script checks the temperature of the raspberrypi
# Written 8/15/14 by adrenaline
#
#########################
#
# Import Libs
import os
import math
import time
import datetime
import smtplib
from email.mime.text import MIMEText

# Main
# Lets clear the screen before we start
#os.system('clear')
# Print a blank line
print

# Lets add some date and time
print datetime.datetime.now().strftime("%A, %d. %B %Y %I:%M%p")

# Lets get the temp
temp = open('/sys/class/thermal/thermal_zone0/temp', 'r')
newtemp = float(temp.read()) 
	# move the decimal point over
newtemp1 = int(newtemp) / 1000
print "The temperature in Celsius is", newtemp1, "degrees,"

# Lets convert this to Fah
fah = int(newtemp1) * 1.8 + 32 

# Results
print "Also the temperature is", fah, "degrees in Fahrenheit"

# Clean up
temp.close()

#print fah
# Alert time
if fah > 160:
	#print("Temp is too High")
	# Send an email if too hot
	SERVER = "smtp.cox.net"
	FROM = 'root@localhost'
	TO = ["repsol05@gmail.com"]
	SUBJECT = 'The Garage Door opener is too Hot!'
	TEXT = "The temperature is", fah, "degrees in Fahrenheit"
	message = """\
	From: %s
	To: %s
	Subject: %s

	%s
	""" % (FROM, ", ".join(TO), SUBJECT, TEXT) 

	server = smtplib.SMTP(SERVER)
	server.sendmail(FROM, TO, message)
	server.quit()


