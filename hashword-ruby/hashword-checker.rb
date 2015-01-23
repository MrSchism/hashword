#! /usr/bin/env ruby

#####################################################################################
# hashword-ruby checker written by:
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]
# 	Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: October 19, 2013
# Current version: January 22, 2015
#####################################################################################

## Declare required components
require 'digest'

## Seed input
puts "\n" # Formatting away from initial line
puts "Seed?" # Requests starting seed
seed = gets.chomp # Input prompt for starting seed

puts "-----------------------------------" # Formatting
long = Digest::SHA256.hexdigest(seed) # Defines 'long'
	puts "\n", "Long:", "\#" + long, "\n" # Prints defined long hashword

short = Digest::MD5.hexdigest(seed) # Defines 'short'
	puts "\n", "Short:", "\#" + short, "\n" # Prints defined short hashword
puts "-----------------------------------" # Formatting

seed = ''
short = ''
long = ''
