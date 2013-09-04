#!/usr/bin/perl -w

$width = "";
$length = "";
$sqf = "";

print 'Enter the amount of shares you have. ';
chomp ($width = <STDIN>);
print 'Enter the worth of the share. ';
chomp ($length = <STDIN>);
$sqf = $width * $length;
print "The total worth is $sqf dollars. \n";
