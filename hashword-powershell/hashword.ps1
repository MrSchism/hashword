 hashword.ps1 Raw
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
######################################################################################
# hashword written by:
#	Joshua "MrSchism" Embrey [mrschism@sdf.org]
#	Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: October 14, 2014
# Current version: November 4, 2014
######################################################################################
 
# Define algorithms
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$sha256 = new-object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
 
# Define encoding
$utf8 = new-object -TypeName System.Text.UTF8Encoding
 
#==== Actual script ====#
 
cls
echo "`n Hashword generator v 2.0 (build 20141104) `n"
echo " Please enter your hashword seed."
echo " *NOTE: hashword seeds are case sensitive.*`n"
$seed = read-host ' Seed' -AsSecure
$yn = read-host "`n Use Long mode? (yes/NO)"
 
if ($yn -eq 'y'){$alg = $sha256}
else {$alg = $md5}
 
$plain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($seed))
$hash = [System.BitConverter]::ToString($alg.ComputeHash($utf8.GetBytes($plain))) -replace "-",''
 
# Dump non-hashword strings immediately after 
$plain = $null
$seed = $null
 
$hash = $hash.tolower()
write-host "`n Your hashword is:`n  #$hash `n"
