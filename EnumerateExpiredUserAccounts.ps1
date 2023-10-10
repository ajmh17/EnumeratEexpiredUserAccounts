# Import the Active Directory module
Import-Module ActiveDirectory

# Get current date
$currentDate = Get-Date

# Enumerate expired user accounts
$expiredUsers = Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $false -and AccountExpirationDate -lt $currentDate} -Properties "SamAccountName", "AccountExpirationDate" | Select-Object SamAccountName, AccountExpirationDate

# Display the expired user accounts
if ($expiredUsers) {
    Write-Host "Expired User Accounts:"
    $expiredUsers | Format-Table
} else {
    Write-Host "No expired user accounts found."
}