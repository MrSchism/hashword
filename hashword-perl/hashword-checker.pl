#! /usr/bin/perl

######################################################################################
# hashword written by:                                                                         
#         Joshua "MrSchism" Embrey [mrschism@sdf.org]                                        
#         Joseph "Arcarna" Preston [jpreston86@gmail.com]                                        
# Intial commit: October 9, 2013                                                         
# Current version: October 16, 2013                                                        
######################################################################################

# Declare used hashing digests
use Digest::SHA qw(sha512_hex);
use Digest::SHA qw(sha256_hex);

# Request seed
print "\n";
print "Seed? ";
$seed = <>;
chomp $seed;

# Visual formatting
print "\n"; 
print "-----\n";
print "\n";

print "Short:\n";
print "\#", sha256_hex($seed), "\n"; # Display short hashword
print "\n";
print "Long:\n";
print "\#", sha512_hex($seed), "\n"; # Display long hashword
print "\n";
