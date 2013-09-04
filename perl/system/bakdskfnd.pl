#!/usr/bin/perl

#This script will find the usb backup disk on boot
#And will clear the standby mode

#Variables
my $dsk;
my $res;
my $msg;

#umount file system
exec(`mount -a`);
exec(`sleep 10`);
exec(`umount /backup`);
exec(`umount /home/share/movies/movies`);
exec(`sleep 10`);

#Look for /dev/sd* *=what?
$dsk = `fdisk -l | grep 1000.2 | cut -d " " -f2` ;
#	print "$dsk\n";
	@disk = split ('',$dsk);
#	print "@disk\n";
#	print "$disk[7]\n";
	$res = "$disk[7]";
#	print "$res\n";
#	$res = d;

#Copy the fstab b or c to the right place

if ($res eq 'b'){

	exec(`cp /etc/fstabb /etc/fstab`);
	exec(`mount -a`);
	exec(`sdparm --clear STANDBY /dev/sdb`);
	break;

} 
elsif ($res eq 'c'){

	exec(`cp /etc/fstabc /etc/fstab`);
	exec(`mount -a`);
	exec(`sdparm --clear STANDBY /dev/sdc`);
	break;

}	
else {

	$msg1 = "/dev/sd* didn't equal b or c nothing is mounted!\n";
	&mail($msg1);

}

#Sub routines
#lets send some mail
sub mail {
	my $err = $_[0];
	my $to='azexptech@gmail.com';
	my $from='root';
	my $subject='Mount and Disk Status';
	open(MAIL, "|/usr/sbin/sendmail -t");

	print MAIL "To: $to\n";
	print MAIL "From: $from\n";
	print MAIL "Subject: $subject\n\n";
	print MAIL "$err\n";
 	close(MAIL);
}
