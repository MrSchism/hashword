#! /usr/bin/env ruby

#####################################################################################
# hashword-ruby written by:
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]
# 	Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: October 16, 2013
# Current version: October 19, 2013
#####################################################################################

## Declare required components
require 'digest'

## Seed input
puts "\n" # Formatting away from initial line
puts "Seed?" # Requests starting seed
system ("stty -echo") # Mitigates shoulder-surfing
seed = gets.chomp # Input prompt for starting seed
system ("stty echo") # Re-enables text echo

## Long mode boolean input
puts "\n" # Formatting
puts "Use long mode?" # Queries for use of long mode
input = gets.chomp # A chomped gets for input regarding long mode
input = input.downcase # Reduces input to downcase

## 'If' statement for presenting long or short hashword
if input == "yes" # Begins 'if yes' of boolean
	long = Digest::SHA512.hexdigest(seed) # Defines 'long'
	puts "\n", "Your hashword is:", "\#" + long, "\n" # Prints defined long hashword
elsif input == "no" # Begins 'if no' of boolean
	short = Digest::SHA256.hexdigest(seed) # Defines 'short'
	puts "\n", "Your hashword is:", "\#" + short, "\n" # Prints defined short hashword
else # Defines escape if 'input' is neither 'yes' or 'no'
	puts "Please answer Yes or No" # Suggests trying again and answering 'yes' or 'no'
end # Ends 'if' statement (and program).
