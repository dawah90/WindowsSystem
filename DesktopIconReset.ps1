Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes" -Name "ThemeChangesDesktopIcons" -Value 0 -Verbose
Get-ItemProperty -Path "C:\$env:HOMEPATH\documents\desktop.ini" -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose
Get-ItemProperty -Path "$env:LOCALAPPDATA\iconcache.db" -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose
