<?php

$parse = file('http://www.teamtrivia.com/page.asp?subject=2'); 
$parse = array_merge($parse,file('http://www.teamtrivia.com/page.asp?subject=1')); 
$on = 0;
$saved = "";
foreach($parse as $line){

	if (preg_match("/content content content/",$line)){
		$on = 0;
		#do_email("$saved");
		#exit;
	}

	if ($on){
		$saved .= "$line";
		
	}

	if (preg_match("/content goes here/",$line)){
		$on = 1;
	}
}
do_email("$saved");
exit;
	
function do_email($message){
	// Always set content-type when sending HTML email
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
	// More headers
	$to = "repsol05@gmail.com,robyn@mostlyhuman.com,brent.wickham@gmail.com,jaypup@gmail.com,cdclegg@gmail.com,psyiode@gmail.com";

		#test portion 
		#$to = "repsol05@gmail.com";

	#Keep line below commented. Gets caught by spam filters if uncommented.
	#$headers .= 'From: <repsol05@gmail.com>' . "\r\n";
	$subject = "TEAM TRIVIA ANSWERS";
	$all_message = "<html>$message</html>";
	mail($to,$subject,$all_message,$headers);
}
?>
	
