#!/usr/bin/perl

$subject = $ARGV[0]; 	
$body = $ARGV[1];
&mail($subject,$body);

sub mail {
        my $to='azexptech@gmail.com';
        my $from='root';
        my $subject=$_[0];
        my $body=$_[1];
        open(MAIL, "|/usr/sbin/sendmail -t");

        print MAIL "To: $to\n";
        print MAIL "From: $from\n";
        print MAIL "Subject: $subject\n\n";
        #mail body
        print MAIL "$body\n";
        close(MAIL);
}

