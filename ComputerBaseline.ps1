if (Get-ExecutionPolicy | Where-Object ($_.Status -ne "Unrestricted")) {
    write-output "Executionpolicy is not Unrestricted"
} else {
    Write-Output "ExecutionPolicy is set to unrestricted"
}

#Source: https://winget.run/
winget install -e --id JAMSoftware.TreeSize
winget install -e --id GitHub.GitHubDesktop
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id PuTTY.PuTTY
winget install -e --id Lexikos.AutoHotkey
winget install sysinternals

$ToolFolder = "C:\_Tools"
#Create folder if it doesn't already exists
if (-not (Test-Path $ToolFolder)) { New-Item -Path $ToolFolder -ItemType Directory }

#Create URL shortcut to https://github.com/dawah90
$ShortcutPath = "$ToolFolder\Github-Dawah90.url"
if (-not (Test-Path $ShortcutPath))
{
$SourceFilePath = "https://github.com/dawah90"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
Write-Output $ShortcutPath
$shortcut.Save()
}

#Create Settings folder
$SettingsFolderPath = "$ToolFolder\SettingsFolder.{ED7BA470-8E54-465E-825C-99712043E01C}"
if (-not (Test-Path $SettingsFolderPath))
{
New-Item -Path $SettingsFolderPath -ItemType Directory
}

<# Windows Terminal Quake mode

Windows Terminal
Settings
* Startup > Launch on machine startup > ON
* Startup and choose "Default terminal application" > Windows-Terminal
* Appearence > Hide terminal in notification area when it is minimized > ON
* Actions > Add New > Show/Hide Quake Window > bind CTRL+SPACE
* Profile powershell and cmd > enable "Run this profile as administrator"

#>

<# Move "invisible window"

Select application window in task bar.
Press "ALT+SPACE" and "F" to attach mouse to it. 
Move window using arrow keys and press "ENTER" to confirm move.

#>

<# Reboot Windows cheat sheet 
Source: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/shutdown

Reboot into UEFI settings
shutdown -t 0 -r -fw

Reboot into Advanced startup
shutdown -t 0 -r -o

Reboot computer and automatically logon to current session
shutdown -g -t 0

Reboot another computer
shutdown -m \\IP-or-DNS -t 0 -r

#>