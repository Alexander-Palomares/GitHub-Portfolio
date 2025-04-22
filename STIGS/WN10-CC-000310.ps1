<#
.SYNOPSIS
    Disables user control over Windows Installer to prevent users from changing installation options, as required by STIG ID WN10-CC-000150.
   
.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000310.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the EnableUserControl value to 0 (disabled)
Set-ItemProperty -Path $regPath -Name "EnableUserControl" -Value 0 -Type DWord

# Confirm the value
Get-ItemProperty -Path $regPath | Select-Object EnableUserControl
