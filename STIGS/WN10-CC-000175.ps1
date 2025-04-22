# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"

# Check if the path exists, if not, create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DisableInventory value to 1 (REG_DWORD)
Set-ItemProperty -Path $regPath -Name "DisableInventory" -Value 1 -Type DWord

# Output the result to verify
Get-ItemProperty -Path $regPath | Select-Object DisableInventory
