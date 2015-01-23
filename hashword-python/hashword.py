#!/usr/bin/env python3

######################################################################################
# hashword written by: 									
#   Joshua "MrSchism" Embrey [mrschism@sdf.org]					
#   Joseph "Arcarna" Preston [jpreston86@gmail.com]					
# Intial commit: November 6, 2013 							
# Current version: January 22, 2015					
######################################################################################

# Declare imports
import hashlib
import os

# Declare VER global constant
global VER
VER = '20150122'

# Start fresh
os.system('cls' if os.name=='nt' else 'clear')
print ("")

print ("Hashword generator v 2.0.3 (build " + VER + ") \n")
print ("Please enter your hashword seed.")
print ("*NOTE: hashword seeds are case sensitive.* \n")

# Request seed
os.system('@echo off' if os.name=='nt' else 'stty -echo')
seed = input("Seed: ")
os.system('@echo on' if os.name=='nt' else 'stty echo')

#Request mode
mode = input("\nUse Long mode (yes/no): ").lower()

# If mode is yes, print long, otherwise print short (ugly, but there).
print ("\nYour hashword is:\n#" + (hashlib.sha256 if mode=='yes' else hashlib.md5)(seed.encode('utf-8')).hexdigest())
print ("")

seed = ''