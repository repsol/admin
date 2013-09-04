#!/usr/bin/perl

#This program will check and fix any issues with my backup drive
#
#

#declare variables
my $fdisk = "";
my @disk = "";
my $res = "";

#checking fdisk reading of backup drive
$fdisk = `fdisk -l | grep 1000 | cut -d " " -f2`;
print "$fdisk\n";
@disk = split ('',$fdisk);
print "@disk\n";
print "$disk[7]\n";
$res = "$disk[7]";
print "hi $res\n";
	if ( "$res" eq "b" ){
		print "Res equals B\n";
	} 
