<#
.SYNOPSIS
    Configures the ECC Curve Order to prioritize stronger curves (NistP384 and NistP256) as required by STIG ID WN10-CC-000220.
   
.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000052.ps1 
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the ECC curve order as a multi-string value
Set-ItemProperty -Path $regPath -Name "EccCurves" -Value @("NistP384", "NistP256") -Type MultiString

# Confirm the value
Get-ItemProperty -Path $regPath | Select-Object -ExpandProperty EccCurves

