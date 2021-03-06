#! /usr/bin/perl

######################################################################################
# hashword written by: 									
#	Joshua "MrSchism" Embrey [mrschism@sdf.org]					
#	Joseph "Arcarna" Preston [jpreston86@gmail.com]					
# Intial commit: October 9, 2013 							
# Current version: January 22, 2015							
######################################################################################

# Declare hashing digests
use Digest::MD5 qw(md5_hex);
use Digest::SHA qw(sha256_hex);
use HTML::Entities;

# Declare 'my' variables as needed
my $in;

# Correctly clear screen based on OS.
if (($^O eq "MSWin32") or ($^O eq "dos")) {
    system ("cls");
}
else {
    system ("clear");
}

print "\n";
print "Hashword generator v 2.0.3 (build 20150122) \n";  # Identifies version/build info (build info in yyyymmdd format)
print "\n";
print "Please enter your hashword seed.\n";
print "*NOTE: hashword seeds are case sensitive.* \n";
print "\n";
print "Seed: "; # Prompt for initial password seed

# Strip terminal echo
if (($^O eq "MSWin32") or ($^O eq "dos")) {
    system ('@echo off');
}
else {
    system ("stty -echo");
}

$seed = <>;
$seed = HTML::Entities::encode($seed);
chomp $seed;

# Return terminal echo
if (($^O eq "MSWin32") or ($^O eq "dos")) {
    system ('@echo on');
}
else {
    system ("stty echo");
}
print "\n";

$long = sha256_hex($seed); # Declare that long uses sha256 on the seed
$short = md5_hex($seed); # Declare that short uses md5 on the seed

until (defined $in) {
    print "Use Long mode? (yes/NO): ";
    $_ = <>;
    $in = 1 if /^Y/i;
    $in = 0 if /^N/i;
    print "\n";
}
if ($in == 1) {
    $hash = $long;
}
else {
    $hash = $short;
}

print "Your hashword is:\n";
print "\#", $hash, "\n";
print "\n";

$seed = '';
$long = '';
$short = '';
$in = '';
$hash = '';

