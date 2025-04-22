<#
.SYNOPSIS
    Disables Basic authentication for Windows Remote Management (WinRM) service to comply with STIG ID WN10-CC-000345.
   
.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Remediates STIG ID WN10-CC-000345 by disabling Basic authentication for WinRM.
    Example syntax:
    PS C:\> .\WN10-CC-000345.ps1 
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

# Create the registry key path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the 'AllowBasic' DWORD to 0 (disabled)
Set-ItemProperty -Path $regPath -Name "AllowBasic" -Value 0 -Type DWord

# Confirm the setting
Get-ItemProperty -Path $regPath | Select-Object AllowBasic
