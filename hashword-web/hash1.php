<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hash Your Password</title>
</head>

<body>
<!--
-######################################################################################
-# hashword written by: 									
-# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]					
-#	Joseph "Arcarna" Preston [jpreston86@gmail.com]					
-# Intial commit: October 30, 2013 							
-# Current version: November 20, 2013							
-######################################################################################
-->

<?php
$seed = (isset($_POST['password']) ? $_POST['password'] : null); //Takes the user input and applies it to the variable "seed".

$hashtype = (isset($_POST['hashtype']) ? $_POST['hashtype'] : null); //Sets the hashtype based on the radio button input.
?>
Please enter your hashword seed.<br />
*NOTE: hashword seeds are case sensitive.*
<form action="?" method="POST">
Seed:<input type="password" name="password"><br />
<input type="radio" value="short" name="hashtype" />Short<br />
<input type="radio" value="long" name="hashtype" />Long<br />
<input type="submit" value="Generate Hash" />
</form>
<br />
<br />
<?php
switch ($hashtype) {
		case "short":
			echo "#" , openssl_digest($seed, 'sha256'); //Outputs seed in SHA256 hash.
			break;
		case "long":
			echo "#" , openssl_digest($seed, 'sha512'); //Outputs seed in SHA512 hash.
			break;
		default:
			echo 'Please select Short or Long'; //Outputs when no radio button is selected.
		}
?>

</body>
</html>