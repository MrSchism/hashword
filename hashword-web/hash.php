<?php
$seed = $_POST['password']; //Takes the user input and applies it to the variable "seed".

$hashtype = $_POST['hashtype']; //Sets the hashtype based on the radio button input.

	if($hashtype == "short"){
		echo "#" , openssl_digest($seed, 'sha256'); //Outputs seed in SHA256 hash.
		}
	elseif ($hashtype == "long"){
        echo "#" , openssl_digest($seed, 'sha512'); //Outputs seed in SHA512 hash.
		}
	else {
		echo "Please select Short or Long"; //Outputs in no radio button is selected.
		}
?>