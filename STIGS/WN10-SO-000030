<#
.SYNOPSIS   
    Enforces advanced audit policy settings by overriding legacy audit categories on Windows 10 systems, as required by STIG ID WN10-SO-000030.
   

.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-21
    Last Modified   : 2025-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000030.ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the AllowDomainPINLogon value to 0 (disabled)
Set-ItemProperty -Path $regPath -Name "AllowDomainPINLogon" -Value 0 -Type DWord

# Confirm the change
Get-ItemProperty -Path $regPath | Select-Object AllowDomainPINLogon
