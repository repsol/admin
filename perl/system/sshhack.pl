#!/usr/bin/perl

#This script reads /var/log/secure and looks for ssh hackers.
#Then adds a IP address to hosts.deny file if authentication fails after 5 tries.

#Open Log file

open(LOG, "/var/log/secure") or die "Can't open file.\n";
	@input = <LOG>;
		foreach my $line (@input){
		if ($line =~ /Failed/){
	#	my $date = 
		print "$line";	


		}
		}

