#!/usr/bin/perl -w
print 'Would you like to see the 11:00am showing of Casablanca, or the 11:00 showing of Shaft? ';
$answer = <>;
chomp $answer;
if ($answer eq 'Casablanca' || $answer eq 'Shaft'){
	print "You said $answer, is that correct?\n";
	$correct = <>;
	chomp $correct;
	if ($correct eq 'yes'){
	print "That'll be \$8.50, please.\n"
	}
#} elsif ($answer eq 'no') {
#	print "Okay--but you're missing a great movie. Have a nice day!\n";
} else {
	print "I'm sorry I didn't understand that.\n";
}


