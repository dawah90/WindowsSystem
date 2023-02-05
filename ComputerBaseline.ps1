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
$ShortcutPath = "C:\_Tools\Github-Dawah90.url"
if (-not (Test-Path $ShortcutPath))
{
$SourceFilePath = "https://github.com/dawah90"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
Write-Output $ShortcutPath
$shortcut.Save()
}
