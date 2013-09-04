#!/usr/bin/perl


#List of servers
open (INPUT, "./devfdq.txt" ) || die "cannot open server-list.txt : $!\n";

#file if you want output saved to a file
open (OUTPUT, ">./fdq.out") || die "cannot open server-info.out : $!\n";

#This loop reads the server-list.txt file
while (<INPUT>)
{
 	chomp;

	# This line assumes there maybe more fields in the input file and severname is the 1st field
	@fields = split, $_;

	#This line runs the ssh command and saves the output into README
	open(README, "ssh -o StrictHostKeyChecking=no $fields[0] \"uname -a\" |") or die "Can not run ssh: $!\n";

	#This loop reads the output from the ssh command
	while (<README>)
	{
		#this line prints the output of the ssh command to the file
		print OUTPUT "$_\n";
	}
	close(README);
}

close (INPUT);
close (OUTPUT);
