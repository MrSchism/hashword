#!/usr/bin/env python3

######################################################################################
# hashword-checker written by:                      
# 	Joshua "MrSchism" Embrey [mrschism@sdf.org]                                        
# 	Joseph "Arcarna" Preston [jpreston86@gmail.com]                                        
# Intial commit: November 6, 2013                                                         
# Current version: November 6, 2013                                                        
######################################################################################

# Imports
import hashlib

# Make room
print ("\n")
# Request seed

seed = input("Seed: ")
print ("-----\n")
print ("Short:")
print ("#" + hashlib.sha256(seed.encode('utf-8')).hexdigest() + "\n")
print ("Long:")
print ("#" + hashlib.sha512(seed.encode('utf-8')).hexdigest() + "\n")
