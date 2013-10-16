#! /usr/bin/env ruby

#####################################################################################
# hashword-ruby written by:                                                                 
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]                                        
# 	Joseph "Arcarna" Preston [jpreston86@gmail.com]                                        
# Intial commit: October 16, 2013                                                         
# Current version: October 16, 2013                                                        
#####################################################################################

# Declare required components
require 'digest'

puts "\n" # Formatting away from initial line
puts "Seed?" # Requests starting seed
system ("stty -echo") # Mitigates shoulder-surfing
seed = gets.chomp # Input prompt for starting seed
system ("stty echo") # Re-enables text echo

puts "\n" # Formatting
puts "Use long mode?" # 
input = gets.chomp
input = input.downcase


if input == "yes"
	long = Digest::SHA512.hexdigest(seed)
	puts "\n", "Your hashword is:", "\n", long, "\n"
elsif input == "no"
	short = Digest::SHA256.hexdigest(seed)
	puts "\n", "Your hashword is:", "\n", short, "\n"
else
	puts "Please answer Yes or No"

end
