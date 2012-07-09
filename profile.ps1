#
# Windows PowerShell Profile for:
# Steven Oliver <oliver.steven@gmail.com>
#

##############################################
# Variables
##############################################
# Reinforce where HOME is
Set-Variable -name HOME -value (Resolve-Path $env:USERPROFILE) -force
(Get-PsProvider FileSystem).Home = $HOME

# Set Oracle home
if ($Env:ORACLE_HOME)
{
    $ORACLE_HOME = $Env:ORACLE_HOME
} 
else {
    # Work - Physical PC
    if ([net.dns]::GetHostName().ToLower() -eq "pdpc-6813"){
        $ORACLE_HOME = "C:\oracle\ora112"
    }
}

##############################################
# External setup functions
##############################################
if ([net.dns]::GetHostName().ToLower() -eq "pdpc-6813"){
    ForEach-Object { [string]::Join([environment]::NewLine, (Get-Content "C:\Documents and Settings\" + [Environment]::UserName + "\My Documents\WindowsPowerShell\Microsoft.PowerShell_scripts.ps1")) | Invoke-Expression }
}

##############################################
# Location Aliases
##############################################
Set-Alias scripts Goto-Scripts
Set-Alias desktop Goto-Desktop
Set-Alias home    Goto-Home
Set-Alias oracle  Goto-Oracle

##############################################
# Program Aliases
##############################################
Set-Alias edit gvim
Set-Alias cc "C:\MinGW\bin\gcc.exe"
Set-Alias gcc "C:\MinGW\bin\gcc.exe"
Set-Alias time Measure-Command
Set-Alias pse "C:\Program Files\PowerGUI\ScriptEditor.exe"
if ([net.dns]::GetHostName().ToLower() -eq "pdpc-6813"){
    Set-Alias sqlplus "$ORACLE_HOME\bin\sqlplus.exe"
}

##############################################
# Setup Window
##############################################
# Try use to unicode if we can
$OutputEncoding = New-Object -typename System.Text.UnicodeEncoding;

# Window colors
$Shell = (Get-Host).UI.RawUI
$Shell.BackgroundColor = "Black"
$Shell.ForegroundColor = "Gray"

# Set window title
$strComputer = "."
$computer = [ADSI]("WinNT://" + $strComputer + ",computer")
$Group = $computer.psbase.children.find("Administrators")
$members= $Group.psbase.invoke("Members") | %{$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}

$Host.UI.RawUI.WindowTitle = "Windows PowerShell - " + [Environment]::UserName 
$found = $false
foreach($user in $members){
    if ($user =  [Environment]::UserName ) {
        $found = $true
    }
}

if ( get-adminuser ) {
    $Host.UI.RawUI.WindowTitle += " (Admin)"
} else {
    $Host.UI.RawUI.WindowTitle += " (User)"
}

# Window size
$size = $Shell.WindowSize
$size.width = 120
$size.height = 35
$Shell.WindowSize = $size

# Buffer size
$size = $Shell.BufferSize
$size.width = 120
$size.height = 3000
$Shell.BufferSize = $size

# Cursor
$Shell.Cursorsize = 12

# Default prompt location
set-location C:\

