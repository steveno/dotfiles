##############################################
# Variables
##############################################
# Reinforce where HOME is
Set-Variable -name HOME -value (Resolve-Path $env:USERPROFILE) -force
(Get-PsProvider FileSystem).Home = $HOME

# Set Oracle home if at work
if ([net.dns]::GetHostName().ToLower() -eq "pdpc-6813"){
    $ORACLE_HOME = "C:\oracle\product\10.2.0\client_1"
}

##############################################
# Aliases
##############################################
set-alias scripts goto_home
Set-Alias edit gvim

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
   $cdelim = [ConsoleColor]::DarkCyan
   if ( get-adminuser ) {
      $chost = [ConsoleColor]::Yellow
   } else {
      $chost = [ConsoleColor]::Green
   }
   $cpref = [ConsoleColor]::Cyan
   $cloc = [ConsoleColor]::Gray
   
   # Create the prompt
   write-host "$([char]0x0A7) " -n -f $cpref
   write-host ([net.dns]::GetHostName().ToLower()) -n -f $chost
   write-host ' {' -n -f $cdelim
   write-host (shorten-path (pwd).Path) -n -f $cloc
   write-host '}' -n -f $cdelim
   
   return ' '
}

##############################################
# Setup Window
##############################################
# Window colors
$Shell = (Get-Host).UI.RawUI
$Shell.BackgroundColor = "Black"
$Shell.ForegroundColor = "Gray"

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
