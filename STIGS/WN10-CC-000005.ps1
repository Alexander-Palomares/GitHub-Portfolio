<#
.SYNOPSIS
    Disables camera access from the lock screen (STIG: WN10-CC-000005).OPSIS
   

.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-21
    Last Modified   : 2025-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000005.ps1 
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set 'NoLockScreenCamera' to 1 (disable camera on lock screen)
Set-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -Value 1 -Type DWord

# Confirm value was set
$setting = Get-ItemProperty -Path $regPath | Select-Object NoLockScreenCamera
Write-Output "NoLockScreenCamera is set to: $($setting.NoLockScreenCamera)"
