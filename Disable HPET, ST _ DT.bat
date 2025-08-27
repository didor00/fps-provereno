@echo off
Title System Timer Optimization
color 0B
echo.
echo ===      OPTIMIZATSIYA SISTEMNOGO TAYMERA (HPET)      ===
echo.
echo Etot skript nastroit sistemnyy taymer na maksimal'nuyu
echo tochnost' i stabil'nost' dlya snizheniya input laga.
echo.
echo !!! VAZHNO !!!
echo Ubedis', chto High Precision Event Timer (HPET) VKLYUCHEN v BIOS/UEFI.
echo.
pause

echo.
echo [1/3] Ubirayu ispol'zovanie starogo taymera platformy...
bcdedit /deletevalue useplatformclock > nul 2>&1

echo [2/3] Otkluchayu dinamicheskiy taymer (Dynamic Tick)...
bcdedit /set disabledynamictick yes

echo [3/3] Prinuditel'no vklyuchayu vysokotochnyy taymer (HPET)...
bcdedit /set useplatformtick yes

echo.
echo ===          ZAVERSHENO          ===
echo.
echo Nastroiki taymera uspeshno primeneny.
echo Dlya polnogo vstupleniya v silu perezagruzi kompyuter.
echo.
pause