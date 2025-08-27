@echo off
color 0B
echo.
echo ===      BEZOPASNAYA OPTIMIZATSIYA ZAGRUZCHIKA WINDOWS (BCD)      ===
echo.
echo Vnimanie! Eti komandy izmenyayut parametry zagruzki.
echo Pered prodolzheniem ubedis', chto HPET vklyuchen v BIOS.
echo.
pause

:: --- 1. Optimizatsiya sistemnogo taymera (snizhenie input laga) ---
echo [1/3] Nastraivayu sistemnyy taymer na maksimal'nuyu tochnost'...
bcdedit /deletevalue useplatformclock > nul 2>&1
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes

:: --- 2. Otkluchenie virtualizatsii (povyshenie otzyvchivosti) ---
echo [2/3] Otkluchayu gipervizor (Hyper-V) dlya snizheniya nagruzki...
bcdedit /set hypervisorlaunchtype off

:: --- 3. Uskorenie protsessa zagruzki (kosmeticheskiy effekt) ---
echo [3/3] Ubirayu zaderzhku na ekrane vybora OS...
bcdedit /timeout 5

echo.
echo ===          ZAVERSHENO          ===
echo.
echo Parametry zagruzchika uspeshno primeneny.
echo Izmeneniya vstupiat v silu posle perezagruzki kompyutera.
echo.
pause