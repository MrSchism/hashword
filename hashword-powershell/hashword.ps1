######################################################################################
# hashword written by:
#  Joshua "MrSchism" Embrey [mrschism@sdf.org]
#	 Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: October 14, 2014
# Current version: May 22, 2015
######################################################################################

# Params
Param(
    [switch]$legacy
)

# Build
$build = 20150522

# Algorithms
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$sha256 = new-object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
 
# Define encoding
$utf8 = new-object -TypeName System.Text.UTF8Encoding
 
# Used variables
$alpha = 0
$num = 1
$dot = 3
$dash = 5
$at = 9

# Function
function myalgo($val){
    $hashword = Switch($val -Split ''){
        {$_ -match "\d" -and $num -ne $dot -and $num -ne $dash -and $num -ne $at}{$_;$num++;continue}
        {$_ -match "\d" -and $num -eq $dot} {$_ + ".";$num++;continue}
        {$_ -match "\d" -and $num -eq $dash} {$_ + "-";$num++;continue}
        {$_ -match "\d" -and $num -eq $at} {$_ + "@";$num = 1;continue}
        {$_ -match "[a-z]" -and $alpha -lt 3} {$_;$alpha++;continue}
        {$_ -match "[a-z]"} {$alpha = 0;[char]::toupper($_)}
    }
    echo "#$($hashword -join '')"
}

#==== Actual script ====#
 
cls
echo "`n Hashword generator v 3.0 (build $build) `n"
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
read-host "Press enter to end..."
