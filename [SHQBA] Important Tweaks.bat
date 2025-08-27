@echo off
Title Pro Gamer Tweaks by Rek OS (Safe Version)
color 0A
echo.
echo ===      BEZOPASNAYA I KOMPLEKSNAYA OPTIMIZATSIYA      ===
echo.
echo Etot skript primenit tol'ko proverennye i effektivnye tviki
echo dlya snizheniya input laga i povysheniya stabil'nosti.
echo.
pause

cls
echo [1/3] Nastraivayu sistemnyy taymer i planirovshchik...
bcdedit /set disabledynamictick yes > nul
bcdedit /deletevalue useplatformclock > nul 2>&1
bcdedit /set useplatformtick yes > nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f > nul
echo Done.

cls
echo [2/3] Otkluchayu energosberezhenie dlya USB i seti...
powershell -Command "Get-PnpDevice | where { $_.InstanceId -like '*USB\ROOT*' } | ForEach-Object { Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root\wmi } | ForEach-Object { Set-CimInstance -Namespace root\wmi -Query "SELECT * FROM MSPower_DeviceEnable WHERE InstanceName LIKE '$($_.InstanceName.Replace('\', '\\'))'" -Property @{Enable=$False} -PassThru }; $adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement; foreach ($adapter in $adapters) { $adapter.AllowComputerToTurnOffDevice = 'Disabled'; $adapter | Set-NetAdapterPowerManagement }"
echo Done.

cls
echo [3/3] Otkluchayu nenuzhnye sluzhby telemetrii...
sc config DiagTrack start= disabled > nul
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul
echo Done.

cls
echo.
echo ===          ZAVERSHENO          ===
echo.
echo Optimizatsiya uspeshno primenena.
echo Dlya polnogo vstupleniya v silu perezagruzi kompyuter.
echo.
pause