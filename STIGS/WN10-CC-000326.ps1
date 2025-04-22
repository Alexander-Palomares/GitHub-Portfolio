<#
.SYNOPSIS
    Enables PowerShell Script Block Logging via the Windows registry to improve visibility into script execution for auditing and threat detection.
    
   
.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000326.ps1 
#>

# Set the registry paths
$basePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell"
$scriptBlockPath = "$basePath\ScriptBlockLogging"

# Create the base path if it doesn't exist
if (-not (Test-Path $basePath)) {
    New-Item -Path $basePath -Force | Out-Null
}

# Create the ScriptBlockLogging subkey if it doesn't exist
if (-not (Test-Path $scriptBlockPath)) {
    New-Item -Path $scriptBlockPath -Force | Out-Null
}

# Set the EnableScriptBlockLogging value to 1
Set-ItemProperty -Path $scriptBlockPath -Name "EnableScriptBlockLogging" -Value 1 -Type DWord

# Confirm the value was set
Get-ItemProperty -Path $scriptBlockPath | Select-Object EnableScriptBlockLogging


