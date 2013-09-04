#!/bin/bash

#This is a script that will develop a weekly status report.
 
#*******Subroutine Starts HERE*******
#
#
# This is a bash subrotine that formats all of the infromation and names the file
#
#

format(){

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
        if [[ "${line}" =~ "SD" ]];
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
        if [[ "${line}" =~ "ST" ]];
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
echo "* OUT OF OFFICE PLANS" >> final.doc
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
# This is where I add the date to the end of the filename

res=`date |awk '{print $2,$3,$6}'`
res=${res//\ /_}

mv final.doc MikeAddicks$res.doc
rm -rf weeksum.txt
#
#
# ******Subroutin Ends HERE******
#
#
}

echo ""

#echo "Report type (ie. Service Desk,CR)"

printf "Weekly Summary\n"
printf "\n"
printf "Press 1 for Service Desk\n"
printf "Press 2 for Star Team\n"
printf "Press 3 for Project\n"
printf "Press 4 for Ops handoff\n"
printf "press 5 for Highlights and Lowlights\n"

read id1

# This is the Highlights and Lowlights section
if [ $id1 == 5 ]; then
	printf "Type your weekly highlight\n"
		read id7
			printf "\n"
 	printf "Type your weekly lowlights\n"
		read id8
	printf "\n"
	printf "Type any Out of Office Plans (List planned training or vacation)\n"
		read id10
	printf "\n"
	printf "Press enter to submit!"
		read id9

			echo ""
			echo "-------------------------------------" >> weeksum.txt
			echo "" >> weeksum.txt
			echo "HL Weekly Highlights: " $id7 >> weeksum.txt
			echo "" >> weeksum.txt
			echo "-------------------------------------" >> weeksum.txt
			echo "" >> weeksum.txt
			echo "LL Weekly Lowlights: " $id8 >> weeksum.txt
			echo ""  >> weeksum.txt
			echo ""
			echo "OO Out of Office Plans: " $id10 >> weeksum.txt
			echo ""	
			# Format Subroutine
			format
		
			printf "Have a good week!\n"; exit 1 
fi


case $id1 in
	1)
		ticket_flag=SD
		id1=Service\ Desk ;;
	2)
		ticket_flag=ST
		id1=Star\ Team ;;
	3)
		ticket_flag=PP
		id1=Project ;;
	4)
		ticket_flag=OH
		id1=Ops\ Handoff ;;
	*)
		echo "That is not a valid number!"; exit 1 ;;

esac
               
	#echo $id1

printf "\n" 

printf "Ticket Number (press Enter for N/A):"

read id2

case $id2 in
	[a,b,d-z,A,B,D-Z])
		echo "That is not a valid number!"; exit 1 ;;
	[0])
		id2=N/A ;;
	"")

		id2=N/A ;;
	*)
		id2=$id2 ;;
		
esac

printf "\n"
               #echo $id2

echo "Severity:"
printf "Press 1 for Low\n"
printf "Press 2 for Medium\n"
printf "Press 3 for High\n"
printf "press Enter for N/A\n"

read id3

case $id3 in
	1)
		id3=Low ;;
	2)
		id3=Medium ;;
	3) 
		id3=High ;;
	"")
		id3=N/A ;;
	*)	
		echo "That is not a valid number!"; exit 1 ;;
		
esac

printf "\n"
	
                #echo $id3

 

echo "Status:"
printf "Press 1 for Completed\n"
printf "Press 2 for In Progress\n"
printf "Press enter for N/A\n"

read id4

case $id4 in
	1)
		id4=Completed ;;
	2)
		id4=In\ Progress ;;
 	"")
		id4=N/A ;;
	*)
		echo "That is not a valid number!"; exit 1 ;;
esac
		

printf "\n"
                #echo $id4

printf "\n"
echo "Comments:"

read id5

echo ""

               

                #echo $id5

 
printf "Hit Enter to submit"

read id6

echo ""

 
tyme=`date`
 

echo "" >> weeksum.txt

echo "--------------------------------------" >>  weeksum.txt

#echo $ticket_flag "Report Type: " $id1 >> weeksum.txt

echo $ticket_flag  $tyme  >> weeksum.txt

echo $ticket_flag "Ticket Number: " $id2 " Severity: " $id3 " Status: " $id4 >> weeksum.txt 

#echo $ticket_flag "Severity: " $id3 >> weeksum.txt

#echo $ticket_flag "Status: " $id4 >> weeksum.txt

echo $ticket_flag "Comments: " $id5 >> weeksum.txt

echo $ticket_flag "" >> weeksum.txt

# Written by Mike Addicks 8/01/09


