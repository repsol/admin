#!/usr/bin/perl -w

$width = "";
$length = "";
$sqf = "";

print 'Enter the width of the room (Feet) ';
chomp ($width = <STDIN>);
print 'Enter the length of the room (Feet) ';
chomp ($length = <STDIN>);
$sqf = $width * $length;
print "The room is $sqf square feet. \n";
