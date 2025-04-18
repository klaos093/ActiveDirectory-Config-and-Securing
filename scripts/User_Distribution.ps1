Import-Module ActiveDirectory

# Base OU where all users currently reside
$sourceOU = "OU=_USERS,DC=mydomain,DC=com"

# Target sub-OUs to randomly assign users
$targetOUs = @(
    "OU=Service,OU=_Users,DC=mydomain,DC=com",
    "OU=Sales,OU=_Users,DC=mydomain,DC=com",
    "OU=Support,OU=_Users,DC=mydomain,DC=com"
)

# Get all users from the source OU
$users = Get-ADUser -Filter * -SearchBase $sourceOU

# Random number generator
$rand = New-Object System.Random

foreach ($user in $users) {
    $randomOU = $targetOUs[$rand.Next(0, $targetOUs.Count)]

    try {
        Move-ADObject -Identity $user.DistinguishedName -TargetPath $randomOU
        Write-Host "Moved $($user.SamAccountName) to $randomOU"
    } catch {
        Write-Host "Failed to move $($user.SamAccountName): $_"
    }
}
