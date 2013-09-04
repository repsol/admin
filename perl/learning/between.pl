#!/usr/bin/perl -w

# Write a script where the array fills in the spaces in between 
# two interactive numbers

$first = '';
$sec = '';
$array = '0';

#$newarray = '';
#$newestarray = '';

print "Enter a number to where you want to start filling in the array. \n";
	chomp ($first = <STDIN>);
print "Enter the second number. \n";
	chomp ($sec = <STDIN>);
#@array = ($first .. $sec);

if ($first <= $sec){
@array = ($first .. $sec );
print "@array\n";
print "\n";
exit;
}
else {
@array = ($sec .. $first);
#print "@array\n";
while ($array[-1] >= $array[0]) {
	print $array[-1];
 	$array[-1]--;
}
}
print "\n";
exit;

