#!/usr/bin/perl -w

$goodbye = "";

while ($goodbye ne "goodbye") {
	print 'Enter your name. ';
	chomp($goodbye = <stdin>);
	print "Hello $goodbye!\n";
}
print "Goodbye till next time!\n";
