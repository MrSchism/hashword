#! /usr/bin/env ruby

#####################################################################################
# hashword-ruby written by:
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]
# 	Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: October 16, 2013
# Current version: January 22, 2015
#####################################################################################

## Declare required components
require 'digest'
require 'rbconfig'

os = RbConfig::CONFIG['host_os']
win = ['windows','mingw32', 'mingw64']

# Fix cross-platform clear function
if win.include? os
	system("cls")
else
	system ("clear")
end

puts "\n" # Formatting away from initial line
puts " Hashword generator v 2.0.3 (build 20150122)" # Name and build version info (version info in yyyymmdd format)
puts "\n" # Formatting
puts " Please enter your hashword seed." # Informs user to input hashword seed
puts " *NOTE: hashword seeds are case sensitive.*" # Case-sensitivity notice
puts "\n" # Formatting

# Strip echoing of user input
if win.include? os
	system ("@echo off")
else 
	system ("stty -echo")
end

# Get user input
seed = [(print ' Seed: '), gets.chomp][1] # Input prompt for starting seed using single-line array

# Return echoing of user input
if win.include? os
	system ("@echo on")
else 
	system ("stty echo")
end

## Long mode boolean input
puts "\n" # Formatting
input = [(print ' Use Long mode? (yes/NO): '), gets.chomp][1] # A chomped gets for input regarding long mode using single-line array
input = input.downcase

if ['yes', 'y'].include? input
    hash = Digest::SHA256.hexdigest(seed)
else
    hash = Digest::MD5.hexdigest(seed)
end
puts "\n", " Your hashword is:", "  \#" + hash, "\n"

seed = ''
input = ''
hash = ''