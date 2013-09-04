#!/bin/bash 

#this sript will parse the weeklysum.doc file and format it to Sandra's liking.
#This where the Hilghts and lowlights start

exec < weeksum.txt
printf "\n" >> final.doc
echo "* WEEKLY HIGHLIGHTS and LOWLIGHTS" >> final.doc
while read line 
do 
	if [[ "${line}" =~  "Weekly Highlights:" ]];
	then 
	printf "\n" >> final.doc
	echo "${line:2}" >> final.doc
	printf "\n" >> final.doc
	fi
	
	if [[ "${line}" =~ "Weekly Lowlights:" ]];
	then
	printf "${line:2}" >> final.doc
	printf "\n" >> final.doc
	printf "\n" >> final.doc
	fi
done

# This is the Service Desk Ticket Section

echo "" >> final.doc
exec < weeksum.txt
echo "* SERVICE DESK TICKETS" >> final.doc
printf "\n"
while read line 
do 
	if [[ "${line}" =~ "ST" ]];
	then
	printf "\n"
	echo "${line:2}" >> final.doc
	printf "\n"
	fi

done

# This is where the Change Requests start

echo "" >> final.doc
exec < weeksum.txt
echo "* CHANGE REQUESTS" >> final.doc
printf "\n"
while read line 
do 
	if [[ "${line}" =~ "CR" ]];
	then
	printf "\n"
	echo "${line:2}" >> final.doc
	printf "\n"
	fi

done

# This is where the Operational Handoffs start

echo "" >> final.doc
exec < weeksum.txt
echo "* OPERATIONAL HANDOFFS" >> final.doc
printf "\n"
while read line 
do 
	if [[ "${line}" =~ "OH" ]];
	then
	printf "\n"
	echo "${line:2}" >> final.doc
	printf "\n"
	fi

done

# This is where the Projects start


echo "" >> final.doc
exec < weeksum.txt
echo "* PROJECTS" >> final.doc
printf "\n"
while read line 
do 
	if [[ "${line}" =~ "PP" ]];
	then
	printf "\n"
	echo "${line:2}" >> final.doc
	printf "\n"
	fi

done

echo "" >> final.doc
exec < weeksum.txt
echo "* Out of Office Plans" >> final.doc
printf "\n"
while read line 
do 
	if [[ "${line}" =~ "OO" ]];
	then
	printf "\n"
	echo "${line:2}" >> final.doc
	printf "\n"
	fi

done


mv final.doc MikeAddicks.doc

# Written by Mike Addicks 8/01/09
