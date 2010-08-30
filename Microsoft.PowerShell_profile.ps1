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
    # This only applies at work
    if ([net.dns]::GetHostName().ToLower() -eq "pdpc-6813"){
        $ORACLE_HOME = "C:\oracle\product\10.2.0\client_1"
    }
}

##############################################
# Aliases
##############################################
set-alias scripts goto_home
set-alias edit gvim
if ([net.dns]::GetHostName().ToLower() -eq "pdpc-6813"){
    set-alias sqlplus "$ORACLE_HOME\bin\sqlplus.exe"
}

##############################################
# Functions
##############################################
function goto_home {
    set-location "$HOME\My Documents\WindowsPowerShell\Scripts"
}

function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''   
   return ($loc)
}

function get-adminuser() {
   $id = [Security.Principal.WindowsIdentity]::GetCurrent()
   $p = New-Object Security.Principal.WindowsPrincipal($id)
   return $p.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function prompt {
   # our theme
   $cdelim = [ConsoleColor]::White
   if ( get-adminuser ) {
      $cuser = [ConsoleColor]::Yellow
   } else {
      $cuser = [ConsoleColor]::Green
   }
   $chost = [ConsoleColor]::Cyan
   $cpath = [ConsoleColor]::Gray
   
   # Create the prompt   
   write-host ([Environment]::UserName) -n -f $cuser
   write-host '@' -n -f $cdelim
   write-host ([Net.DNS]::GetHostName().ToLower()) -n -f $chost   
   write-host ' ' -n -f $cdelim
   write-host (shorten-path (pwd).Path) -n -f $cpath
   write-host ' $' -n -f $cpath
   
   return ' '
}

##############################################
# Setup Window
##############################################
# Window colors
$Shell = (Get-Host).UI.RawUI
$Shell.BackgroundColor = "Black"
$Shell.ForegroundColor = "Gray"

# Set window title
$Host.UI.RawUI.WindowTitle = "Windows PowerShell - "
$Host.UI.RawUI.WindowTitle += [Environment]::UserName 
if ( get-adminuser ) {
    $Host.UI.RawUI.WindowTitle += " (Admin)"
} else {
    $Host.UI.RawUI.WindowTitle += " (User)"
}

# Reset the screen
clear

# Window size
$size = $Shell.WindowSize
$size.width = 120
$size.height = 35
$Shell.WindowSize = $size

# Buffer size
$size = $Shell.BufferSize
$size.width = 120
$size.height = 4000
$Shell.BufferSize = $size

# Default prompt location
set-location C:\
