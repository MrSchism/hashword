######################################################################################
# hashword-checker v3 written by:
#         Joshua "MrSchism" Embrey [mrschism@sdf.org]
#         Joseph "Arcarna" Preston [jpreston86@gmail.com]
# Intial commit: April 16, 2015
# Current version: April 16, 2015
######################################################################################

# Params
Param(
    [switch]$legacy
)
 
# Algorithms
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$sha256 = new-object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
 
# Encoding
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

echo "`n Seed?"
$seed = read-host
 
$short = ([System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($seed))) -replace "-",'').tolower()
$long = ([System.BitConverter]::ToString($sha256.ComputeHash($utf8.GetBytes($seed))) -replace "-",'').tolower()
 
echo " -----`n"

# Legacy mode
if ($legacy -eq $true){ 
    echo "Short:`n #$short `n"
    echo "Long:`n #$long `n"
}

else {
    echo "Short:`n $(myalgo $short) `n"
    echo "Long:`n $(myalgo $long) `n"
}