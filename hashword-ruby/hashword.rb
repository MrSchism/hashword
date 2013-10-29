#! /usr/bin/env ruby

#####################################################################################
# hashword-ruby written by:
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]
# 	Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: October 16, 2013
# Current version: October 29, 2013
#####################################################################################

## Declare required components
require 'digest'

## Seed input
system ("clear") # Starts fresh
puts "\n" # Formatting away from initial line
puts "Hashword generator v 1.2 (build 20131029)" # Name and build version info (version info in yyyymmdd format)
puts "\n" # Formatting
puts "Please enter your hashword seed." # Informs user to input hashword seed
puts "*NOTE: hashword seeds are case sensitive.*" # Case-sensitivity notice
puts "\n" # Formatting
system ("stty -echo") # Mitigates shoulder-surfing
seed = [(print 'Seed: '), gets.chomp][1] # Input prompt for starting seed using single-line array
system ("stty echo") # Re-enables text echo

## Long mode boolean input
puts "\n" # Formatting
input = [(print 'Use Long mode? (yes/no): '), gets.chomp][1] # A chomped gets for input regarding long mode using single-line array
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
