#! /usr/bin/perl

######################################################################################
# hashword written by: 									
#	Joshua "MrSchism" Embrey [mrschism@sdf.org]					
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

# Correctly clear screen based on OS.
if ($^O eq "MSWin32")
	{
		system ("cls");
	}
elsif ($^O eq "dos")
	{
		system ("cls");
	}
else 
	{
		system ("clear");
	}
print "\n";
print "Hashword generator v 1.2.1 (build 20131126) \n";  # Identifies version/build info (build info in yyyymmdd format)
print "\n";
print "Please enter your hashword seed.\n";
print "*NOTE: hashword seeds are case sensitive.* \n";
print "\n";
print "Seed: "; # Prompt for initial password seed

# Strip terminal echo
if ($^O eq "MSWin32")
	{
		system ('@echo off');
	}
elsif ($^O eq "dos")
	{
		system ('@echo off');
	}
else 
	{
		system ("stty -echo");
	}
$seed = <>;
$seed = HTML::Entities::encode($seed);
chomp $seed;

# Return terminal echo
if ($^O eq "MSWin32")
	{
		system ('@echo on');
	}
elsif ($^O eq "dos")
	{
		system ('@echo on');
	}
else 
	{
		system ("stty echo");
	}
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
