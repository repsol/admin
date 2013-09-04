#!/usr/bin/perl -w

$fahr = 0;
$cel = 0;

print 'Enter a temperature in Fahrenheit: ';
chomp ($fahr = <STDIN>);
$cel = ($fahr - 32) * 5 / 9;
print '$Fahr degrees Fahrenheit is equivalent to ';
printf ("%d degrees Celsius\n", $cel);

