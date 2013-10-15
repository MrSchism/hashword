#! /usr/bin/perl

# hashword-checker written by: 
# 	Joshua "MrSchism" Embrey
#	Joseph "Arcarna" Preston
# October 14, 2013

# Declare used hashing digests
use Digest::SHA qw(sha512_hex);
use Digest::SHA qw(sha256_hex);

# Request seed
print "\n";
print "Seed? ";
$seed = <>;

# Visual formatting
print "\n"; 
print "-----\n";
print "\n";

print "Short:\n";
print sha256_hex($seed), "\n"; # Display short hashword
print "\n";
print "Long:\n";
print sha512_hex($seed), "\n"; # Display long hashword
print "\n";
