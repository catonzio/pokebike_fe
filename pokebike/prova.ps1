Function Get-RandomPassword
{
    #define parameters
    param([Parameter(ValueFromPipeline=$false)][ValidateRange(1,256)][int]$PasswordLength = 10)
 
    #ASCII Character set for Password
    $CharacterSet = @{
            Lowercase   = (97..122) | Get-Random -Count 10 | % {[char]$_}
            Uppercase   = (65..90)  | Get-Random -Count 10 | % {[char]$_}
            Numeric     = (48..57)  | Get-Random -Count 10 | % {[char]$_}
            SpecialChar = (33..47)+(58..64)+(91..96)+(123..126) | Get-Random -Count 10 | % {[char]$_}
    }
 
    #Frame Random Password from given character set
    $StringSet = $CharacterSet.Uppercase + $CharacterSet.Lowercase + $CharacterSet.Numeric + $CharacterSet.SpecialChar
 
    -join(Get-Random -Count $PasswordLength -InputObject $StringSet)
}
 
#Call the function to generate random password of 8 characters
Get-RandomPassword -PasswordLength 16


#Read more: https://www.sharepointdiary.com/2020/04/powershell-generate-random-password.html#ixzz8oMRwmrnM