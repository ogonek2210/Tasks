<#
.SYNOPSIS
    Saves a list of all active OS processes sorted by PID to another new file.
.DESCRIPTION
     Saves a list of all active OS processes sorted by PID to another new file.
.PARAMETER FilePath
    Optional [string] - The path to the file where all the results will be saved
.NOTES
    Author: Hanna S
    Date:   31.05.2022
#>

param(
    [Parameter(Mandatory = $false)] 
    [string]$FilePath = ".\Process_list.txt"
)

# The main function.
function Invoke-Main {
    Get-Process | Sort-Object -Property Id | Out-File -FilePath $FilePath
}

# Executing main.
Invoke-Main
