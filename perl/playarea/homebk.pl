#!/usr/bin/perl

#This script will re-attach the external storage to the mount
#written 8/18/10

#Declare Variables
my $mnt;
my @disk;
my $res;
my $u;
my $s;
my $m;
my $fstb;
my $fdsk;
my @fdk;
my $fdres;
my $err1;
my $err2;
my $msg1;

#Lets start with unmounting and remounting the aux drive
#&mount;

#Lets unmount the drive we don't want to backup
exec(`umount /home/share/movies/movies`);

#Lets make sure we are using the right fstab
#THIS IS NOT NEEDED ANYMORE I am commenting it out but leaving it for now.
#$fdsk = `fdisk -l | grep 1000.2 | cut -d" " -f2`;
#	#print "fdisk $fdsk\n";
#	@fdk = split ('',$fdsk);
#	#print "@fdsk";
#	$fdres = "$fdk[7]";
#Test	$fdres = "c";
#	print "b=$fdres\n";
#		if ( $fdres eq "b" ){
#	
#			exec(`cp /etc/fstabb /etc/fstab`);
#
#		}elsif ($fdres eq "c" ){
#
#			exec(`cp /etc/fstabc /etc/fstab`);	
#
#		}else{
#
#			$err1 =  "There is something wrong with the output of fdisk -l\n";
#			&mail($err1);
#			break;
#		}

#Lets unmount and remount /backup
#&mount;

#Lets see if /backup is mounted 
$mnt=`df -h |grep /backup`;
	@bk = split ('',$mnt);
	#print "@bk\n";
	#print "$bk[50]\n";
	$res = "$bk[50]";
	#$res = "a";
	print "p=$res\n";
		if ($res ne "p"){

			#exec(`mount /backup`);
			#mail error saying there is a problem with df -h or mount
			$err2 =  "There is something wrong with the output of df -h or mount\n";
			&mail($err2);
			exit;

		}else{

			#print "the backups are running!";
			#here is where I rsync
			exec(`rsync -aqz --delete /home /backup/homebak`);
			$msg1 = "This was a successful backup of /home today!";
			&mail($msg1);
			#here is where we re-mount the drive we aren't backing up
			exec(`mount /home/share/movies/movies`);
			exit;
		}

#SubRoutines

#Lets unmount and remount /backup
sub mount {
	$u = `umount /backup`;
	$s = `umount /home/share/movies/multimedia`;
	$m = `mount -a`;
}

#lets send some mail
sub mail {
	my $err = $_[0];
	my $to='azexptech@gmail.com';
	my $from='root';
	my $subject='Backup Status';
	open(MAIL, "|/usr/sbin/sendmail -t");

	print MAIL "To: $to\n";
	print MAIL "From: $from\n";
	print MAIL "Subject: $subject\n\n";
	print MAIL "$err\n";
 	close(MAIL);
}
