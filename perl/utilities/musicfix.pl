#!/usr/bin/perl 

#This script strips the numbers off of the front of the names in the music Directory

#open the folder that needs the numbers stripped
$path = "/home/share/music/60s";
$files = `ls -1 $path`;
	@lines = split ("\n",$files);
	foreach my $line (@lines){
		if ($line =~/^[0-99]/){
		my $new = substr($line,5);
			$line=~ s/\s/\\ /g; #strip the spaces and special characters
			$line=~ s/\'/\\'/g;
			$line=~ s/\-/\\-/g;
			$line=~ s/\(/\\(/g;
			$line=~ s/\)/\\)/g;
#		print "$new\n";	
			$new=~ s/\s/\\ /g;
			$new=~ s/\'/\\'/g;
			$new=~ s/\-/\\-/g;
			$new=~ s/\(/\\(/g;
			$new=~ s/\)/\\)/g;
		print "$line\n";
		print "$new\n";	
		`mv $path/$line $path/$new`;
}
}


