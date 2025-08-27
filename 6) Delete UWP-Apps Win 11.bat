@echo off

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground " /t REG_DWORD /d "2" /f

Powershell "get-appxpackage -AllUsers *Windows.DevHome* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *Microsoft.PowerAutomateDesktop* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *Microsoft.BingNews* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *OutlookForWindows* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *Clipchamp.Clipchamp* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *QuickAssist* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *windowscalculator* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *feedback* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *GetHelp* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *Camera* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *phone* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *ScreenSketch* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *StickyNotes* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *windowsalarms* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *officehub* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *zunemusic* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *solitairecollection* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *soundrecorder* | Remove-AppxPackage"
Powershell "get-appxpackage -AllUsers *bingweather* | Remove-AppxPackage"

start ms-settings:appsfeatures

pause >nul