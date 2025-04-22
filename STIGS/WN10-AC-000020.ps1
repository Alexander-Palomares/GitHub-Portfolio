<#
.SYNOPSIS
   Configures the "Enforce password history" policy to 24 passwords remembered, as required by STIG ID WN10-AC-000020.
   
.NOTES
    Author          : Alexander Palomares
    LinkedIn        : linkedin.com/in/alexander-palomares-a867202b1/ 
    GitHub          : github.com/Alexander-Palomares
    Date Created    : 2025-04-22
    Last Modified   : 2025-04-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
    
Remediation Steps:

To ensure the system complies with the required STIG, follow these steps to enforce a password history of 24 passwords:

1)  Open the Group Policy Editor (if it's not open already).
  1a) Open with the "Run" dialog box (Windows + R) 
  1b) Search "gpedit.msc"

2)  Navigate to the Policy Setting :
  2a)  Ensure your on the Local Computer Policy Setting
  2b)  Go to Computer Configuration > Windows Settings > Security Settings > Account Policies > Password Policy.

3)  Modify the "Enforce password history" Policy:
  3a)  Double-click "Enforce passowrd history" 
  3b)  Modify value of "password remembered" to 24

4)  Confirm modifications
  4a) Cick "Apply" then "OK"

#>
