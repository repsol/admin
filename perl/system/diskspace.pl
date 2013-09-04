#!/usr/bin/perl 

system("df -h > df.txt");
open(FILE, "df.txt");
@percent = <FILE>;
close(FILE);
system("rm -f df.txt");
@du = split(/ +/,$percent[2]);
$res= $du[4];
$res=~s/%//;
printf "Disk space is $res \% \n";
#debug here
#$res = 85;
#if ($res>=90){
#	$subject = "Disk is Full! \\ is $res\%";
#	$body = `hostname`;
#	$mail = `/home/admin/scripts/perl/subs/mail.pl "$subject" "$body"`;
#}

