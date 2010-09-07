#
# Windows PowerShell Profile Setup Scripts for:
# Steven Oliver <oliver.steven@gmail.com>
#

function goto_home {
    set-location "$HOME\My Documents\WindowsPowerShell\Scripts"
}

function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''   
   return ($loc)
}

function time {
    $time = date    
    return "`r`n" + $time.toShortDateString() + " " + $time.toShortTimeString() + "`r`n" 
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

# History functions borrowed from: http://www.ravichaganti.com/blog/?p=1248
function Export-History {
 param ([string]$path=$historyPath)
 $cmdArray = @()
 if (Test-Path $path) {
    $savedHistory = @(Import-Clixml $historyPath)            
    $savedHistory | % { $cmdArray += $_.CommandLine }            

    Get-History -Count $MaximumHistoryCount | % {
        #first level of filtering
        if ($cmdArray -notcontains $_.CommandLine) { $savedHistory += $_ }             

        #Second level of filtering to remove duplicates from current session also
        $cmdArray = @()
        $savedHistory | % { $cmdArray += $_.CommandLine }
    }            

    $savedHistory | Export-Clixml $path    
 } 
 else {
    Get-History -Count $MaximumHistoryCount | Export-Clixml $path    
 }
}            

function Import-History {
    param ([parameter(mandatory=$true)][string]$path=$historyPath)
    
    if (Test-Path $(Split-Path $path)) {
        Import-Clixml $path | ? {$count++;$true} | Add-History
        Write-Host -Fore Green "`nLoaded $count history item(s)`n"
    }
}   
