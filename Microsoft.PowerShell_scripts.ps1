#
# Windows PowerShell Profile Setup Scripts for:
# Steven Oliver <oliver.steven@gmail.com>
#

##############################################
# uname clone
##############################################
function wname {            
    $colItems = get-wmiobject -class "Win32_Processor" -computername localhost
    
    $memory = get-mem
    $memory = $memory.ToString() + " MB"     
    
    Write-Host "Platform    - " ([Environment]::OSVersion.Platform.ToString())
    Write-Host "Windows Ver - " ([Environment]::OSVersion.VersionString.ToString())
    Write-Host "Arch        - " $colItems.Description.ToString()
    Write-Host "Processor   - " $colItems.Name.ToString()    
    Write-Host "Speed       - " $colItems.MaxClockSpeed
    Write-Host "Cores       - " $colItems.NumberOfCores
    Write-Host "Memory      - " $memory
    Write-Host "Date        - " (date).ToString()
}

function Get-Mem {
    $a = Get-WmiObject win32_physicalmemory -computername ([Net.DNS]::GetHostName())
    foreach ($b in $a) {
        if ($b.device_locator -ne "SYSTEM ROM") {
            return ($b.capacity/1mb).ToString()
        }
    }
}

function goto_home {
    set-location "$HOME\My Documents\WindowsPowerShell\Scripts"
}

function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''   
   return ($loc)
}

function Time {
    $time = date    
    return "`r`n" + $time.toShortDateString() + " " + $time.toShortTimeString() + "`r`n" 
}

function Show-IP {
    return (Test-Connection $env:COMPUTERNAME -Count 1).ProtocolAddress   
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

