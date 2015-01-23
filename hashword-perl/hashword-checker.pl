#! /usr/bin/perl

######################################################################################
# hashword written by:                                                                         
#         Joshua "MrSchism" Embrey [mrschism@sdf.org]                                        
#         Joseph "Arcarna" Preston [jpreston86@gmail.com]                                        
# Intial commit: October 9, 2013                                                         
# Current version: January 22, 2015                                                        
######################################################################################

# Declare used hashing digests
use Digest::MD5 qw(md5_hex);
use Digest::SHA qw(sha256_hex);
use HTML::Entities;

# Request seed
print "\n";
print "Seed? ";
$seed = <>;
$seed = HTML::Entities::encode($seed);
chomp $seed;

# Visual formatting
print "\n"; 
print "-----\n";
print "\n";

print "Short:\n";
print "\#", md5_hex($seed), "\n"; # Display short hashword
print "\n";
print "Long:\n";
print "\#", sha256_hex($seed), "\n"; # Display long hashword
print "\n";

$seed = '';