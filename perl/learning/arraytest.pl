#!/usr/bin/perl -w

@alphebet = ('a' .. 'z');
@number = ('1' .. '21');

print "\n";
print "Print the output of the alphabet array!\n";
print "@alphebet\n";
print "Print the output of the number array!\n";
print "@number\n";
print "Print the 9th element fo the number array\n";
print "$number[9]\n";
print "\n";
print "Print the loop through the alphabet array\n";
foreach $alphebet (@alphebet) {
	print "$alphebet";

}
print "\n";
print "\n";
$number = @alphebet;
print "Print the number of scalars in the alphabet array\n";
print "$number\n";
