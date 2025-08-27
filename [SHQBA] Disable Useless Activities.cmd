@echo off
color 0A
echo.
echo ===      BEZOPASNOE OTKLYUCHENIE NENUZHNYKH SLUZHB      ===
echo.
echo Etot skript otkluchit tol'ko te sluzhby, kotorye bezopasny
echo dlya igrovogo PK i ne narushat stabil'nost' sistemy.
echo.
pause

:: --- Telemetriya i sbor dannykh ---
echo Otkluchayu sluzhby telemetrii...
sc config DiagTrack start= disabled > nul
sc config dmwappushservice start= disabled > nul

:: --- Ustarevshie funktsii ---
echo Otkluchayu ustarevshie sluzhby (Domashnyaya gruppa, Faks)...
sc config HomeGroupListener start= disabled > nul
sc config HomeGroupProvider start= disabled > nul
sc config Fax start= disabled > nul 2>&1

:: --- Nenuzhnye dlya igr funktsii ---
echo Otkluchayu sluzhby, nenuzhnye dlya igr (Telefon, Planshet)...
sc config PhoneSvc start= disabled > nul
sc config TabletInputService start= disabled > nul 2>&1
sc config RetailDemo start= disabled > nul

:: --- Optsional'no, no polezno ---
echo Otkluchayu sluzhbu poiska Windows Search (osvobozhdaet resursy)...
echo Esli ty pol'zuesh'sya poiskom v menyu Pusk, eto mozhet ego zamedlit'.
sc config WSearch start= disabled > nul

echo Otkluchayu SysMain (Superfetch), polezno dlya SSD...
sc config SysMain start= disabled > nul

:: --- Sluzhby pol'zovatel'skogo profilya (cherez reestr) ---
echo Otkluchayu nenuzhnye pol'zovatel'skie sluzhby...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v Start /t REG_DWORD /d 4 /f > nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\OneSyncSvc" /v Start /t REG_DWORD /d 4 /f > nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v Start /t REG_DWORD /d 4 /f > nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 4 /f > nul

echo.
echo ===          ZAVERSHENO          ===
echo.
echo Izmeneniya vstupiat v silu posle perezagruzki kompyutera.
echo.
pause