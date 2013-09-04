#!/usr/bin/perl -w

$input = '';
$count = 0;
$sum = 0;
$avg = 0;

while () {
	print 'Enter a number: ';
	chomp ($input = <STDIN>);
	if ($input ne '') {
		$count++;
		$sum += $input;
	} 
	else { last; }
}

$avg = $sum / $count;

print "\nTotal count of numbers: $count\n";
print "Total sum of number: $sum\n";
printf ("Average (mean): %.2f\n", $avg);
