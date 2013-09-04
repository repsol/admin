#!/usr/bin/perl

#
#This script will alert azexptech if there is a CPU Temp. issue
#

#Declare variables
my $line;
my $mess;
my $msg1;

#Let's open the messages file and check for Temp. errors.
open(FILE, '/var/log/messages') or die "Can't open the file\n";
	@input = <FILE>;	

	foreach $line (@input){
		if ($line =~ /Temperature/){
			$mess .= "$line";
		  	#print "this is $mess";
			$msg1 = "$mess\n";
			&mail($msg1);
		} 
	}

#&mail($msg1);
close FILE;

#lets send some mail
sub mail {
	my $err = $_[0];
	my $to='azexptech@gmail.com';
	my $from='root';
	my $subject='Temperature Issues';
	open(MAIL, "|/usr/sbin/sendmail -t");

	print MAIL "To: $to\n";
	print MAIL "From: $from\n";
	print MAIL "Subject: $subject\n\n";
	print MAIL "$err\n";
 	close(MAIL);
}

