#! /usr/bin/perl

######################################################################################
# hashword written by: 									
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]					
#	Joseph "Arcarna" Preston [jpreston86@gmail.com]					
# Intial commit: October 9, 2013 							
# Current version: November 20, 2013							
######################################################################################

# Declare hashing digests
use Digest::SHA qw(sha512_hex);
use Digest::SHA qw(sha256_hex);
use HTML::Entities;

# Declare 'my' variables as needed
my $in;

system ("clear");
print "\n";
print "Hashword generator v 1.2.1 (build 20131120) \n";  # Identifies version/build info (build info in yyyymmdd format)
print "\n";
print "Please enter your hashword seed.\n";
print "*NOTE: hashword seeds are case sensitive.* \n";
print "\n";
print "Seed: "; # Prompt for initial password seed
system ("stty -echo"); # Remove stty echo for password privacy
$seed = <>;
$seed = HTML::Entities::encode($seed);
chomp $seed;
system ("stty echo"); # Return stty echo for easier yes/no
print "\n";

$long = sha512_hex($seed); # Declare that long uses sha512 on the seed
$short = sha256_hex($seed); # Declare that short uses sha256 on the seed

# Until loop requesting yes/no for use of long (sha512) mode
until (defined $in) {
	print "Use Long mode? (yes/no): ";
	$_ = <>;
	$in = 1 if /^Y/i;
	$in = 0 if /^N/i;
	print "\n";
	}
if ($in == 1) {
	print "Your hashword is:\n";
	print "\#", $long, "\n";
	print "\n";
	}
else {
	print "Your hashword is:\n";
	print "\#", $short, "\n";
	print "\n";
	}
