#!/usr/bin/perl 
#
#This script opens a website with my IP then records it and emails me.
#
#
#Declare variables
my $url;
my $text = "/home/admin/text/myip.txt";
my $pop;
#open URL where my IP is broadcast. 

#$url=`curl -s -f http://whatismyip.com/automation/n09230945.asp`;
$url=`curl -s -f http://whatismyip.org`;
#$url = `curl -s checkip.dydns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*//'`;
#$url = `curl -s checkip.dydns.org ` ;
					#print "url=$url\n";
	open(FILE, "$text") or die "Can't open $text : $!";
		@file = <FILE>;
	close(FILE);
		$pop =	pop(@file);
				       #print "first$pop\n";
				       #print "sec$url\n";
		chomp ($pop);
		if ($pop == $url){
			exit;
		} else {
			&mail($url);
	open(FILEOUT, ">>$text") or die "Can't open $text : $!";
			print FILEOUT "$url\n"; 
	close(FILEOUT);
				       #print "p$pop\n";
				       #print "u$url\n";
		
		}

sub mail {
	my $to='azexptech@gmail.com';
	my $from='root';
	my $subject='New IP-Address';
	open(MAIL, "|/usr/sbin/sendmail -t");

	print MAIL "To: $to\n";
	print MAIL "From: $from\n";
	print MAIL "Subject: $subject\n\n";
	#mail body
	print MAIL "Your new IP Address is $url.\n";
 	close(MAIL);
}
