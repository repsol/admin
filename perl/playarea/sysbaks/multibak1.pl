#!/usr/bin/perl

#This script will backup the home dir
#written 4/26/11

#Declare Variables

#meat of the script
exec(`rsync -vazq --delete /bin /media/backup/`);
exec(`rsync -vazq --delete /boot /media/backup/`);
exec(`rsync -vazq --delete /dev /media/backup/`);
exec(`rsync -vazq --delete /etc /media/backup/`);
exec(`rsync -vazq --delete /lib /media/backup/`);
exec(`rsync -vazq --delete /opt /media/backup/`);
exec(`rsync -vazq --delete /misc /media/backup/`);
$msg1 = "This was a successful backup of /bin,/boot,/dev,/etc,/lib,/opt,/misc last night!";
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
