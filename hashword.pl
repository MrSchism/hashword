#! /usr/bin/perl

## hashword script written by Joshua "MrSchism" Embrey and Joseph "Arcarna" Preston
## WTFPL 2013

# Declare usable digests
use Digest::SHA qw(sha256_hex);
use Digest::SHA qw(sha512_hex);

# Request hashword length
print "Would you like short or long?\n";
$input = <>;

print "Seed?  "; # Request seed password
system ("stty -echo"); # Drop echo'd characters
$seed = <>; # Grab $seed
system ("stty echo"); # Re-enable echo

if($input == "short") {
	 print sha256_hex($seed), "\n"; # Print the short hashword
					}
 elsif ($input == "long") {
	 print sha512_hex($seed), "\n"; # Print the long hashword
					}
 else {
 	die ("Please answer with long or short\n"); # Fail catastrophically
 	}

