#!/usr/bin/perl

#This script will backup the home dir
#written 4/26/11

#Declare Variables

#meat of the script
exec(`rsync -vazq --delete /proc /media/backup/`);
exec(`rsync -vazq --delete /root /media/backup/`);
exec(`rsync -vazq --delete /sbin /media/backup/`);
exec(`rsync -vazq --delete /selinux /media/backup/`);
exec(`rsync -vazq --delete /srv /media/backup/`);
exec(`rsync -vazq --delete /sys /media/backup/`);
exec(`rsync -vazq --delete /tmp /media/backup/`);
exec(`rsync -vazq --delete /usr /media/backup/`);
exec(`rsync -vazq --delete /var /media/backup/`);
$msg1 = "This was a successful backup of /proc,/root,/sbin,/selinux,/srv,/sys,/tmp,/usr,/var, last night!";
&mail($msg1);

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
