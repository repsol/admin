#!/usr/bin/perl -w
#This file watches for "Accepted" in the /var/log/secure 
#It grabs the Accepted file then the next three. It logs
#them and sends an email. sshwatch.txt

#use strict;

#declare variables
my $input = "";
my $c = 0;
my $out = "";

#ask questions
#	print "\nWhat log file do you want to monitor? ";
#	 $logfile=<STDIN>;
#	chomp ($logfile);

#open file to watch.
		open(LOG, "/var/log/secure") or die "can't open the file\n";
			@input = <LOG>;
				foreach my $line (@input){
					if ($line =~ /Accepted/){
						print "$line ";
						$out .= $line;
						$c = 3;
					}
					else {
						if ($c > 0){
							print "$line";
							$out .= $line;
							$c--;
						}
				
					}

				}		
		close(LOG);
#Adding to a file /home/root/sshwatch.txt
		open(FILE,">>/home/admin/logs/sshwatch.txt") or die "Can't open the file\n";
			print FILE $out;
		close(FILE);

	
