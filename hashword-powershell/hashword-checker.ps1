######################################################################################
# hashword written by:
#         Joshua "MrSchism" Embrey [mrschism@sdf.org]
#         Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: November 4, 2014
# Current version: November 4, 2014
######################################################################################
 
# Algorithms
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$sha256 = new-object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
 
# Encoding
$utf8 = new-object -TypeName System.Text.UTF8Encoding
 
echo "`n Seed?"
$seed = read-host
 
$short = ([System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($seed))) -replace "-",'').tolower()
$long = ([System.BitConverter]::ToString($sha256.ComputeHash($utf8.GetBytes($seed))) -replace "-",'').tolower()
 
echo "-----`n"
 
echo "Short:`n #$short `n"
echo "Long:`n #$long `n"
