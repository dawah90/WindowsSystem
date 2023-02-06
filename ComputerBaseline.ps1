if (Get-ExecutionPolicy | Where-Object ($_.Status -ne "Unrestricted")) {
    write-output "Executionpolicy is not Unrestricted"
} else {
    Write-Output "ExecutionPolicy is set to unrestricted"
}

#Source: https://winget.run/.
winget install -e --id JAMSoftware.TreeSize
winget install -e --id GitHub.GitHubDesktop
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id PuTTY.PuTTY
winget install -e --id Lexikos.AutoHotkey
winget install -e --id voidtools.Everything
winget install -e --id Greenshot.Greenshot
winget install -e --id 7zip.7zip
winget install -e --id DominikReichl.KeePass
winget install -e --id Google.Drive
winget install -e --id GitHub.GitHubDesktop
winget install sysinternals

#Define toolsfolder.
$ToolFolder = "C:\_Tools"

#Create folder if it doesn't already exists.
if (-not (Test-Path $ToolFolder)) { New-Item -Path $ToolFolder -ItemType Directory }

#Create URL shortcut to https://github.com/dawah90.
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

#Create shortcut to WindowsTerminal.
$ShortcutPath = "$ToolFolder\WindowsTerminal.lnk"
if (-not (Test-Path $ShortcutPath))
{
    $SourceFilePath = "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.15.3466.0_x64__8wekyb3d8bbwe\wt.exe"
    if (Test-Path $SourceFilePath) {
        $WScriptObj = New-Object -ComObject ("WScript.Shell")
        $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
        $shortcut.TargetPath = $SourceFilePath
        Write-Output $ShortcutPath
        $shortcut.Save()
    }
}

#Create Settings folder.
$SettingsFolderPath = "$ToolFolder\SettingsFolder.{ED7BA470-8E54-465E-825C-99712043E01C}"
if (-not (Test-Path $SettingsFolderPath)) { New-Item -Path $SettingsFolderPath -ItemType Directory }

