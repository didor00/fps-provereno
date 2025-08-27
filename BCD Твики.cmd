@echo off
Title Safe BCD Tweaks
color 0B
echo.
echo ===      BEZOPASNAYA OPTIMIZATSIYA ZAGRUZCHIKA WINDOWS (BCD)      ===
echo.
echo Vnimanie! Dlya polnogo effekta ot tvika s taymerom
echo rekomenduetsya vklyuchit' HPET v BIOS.
echo.
pause

:: --- 1. Otkluchenie virtualizatsii (povyshenie otzyvchivosti) ---
echo [1/2] Otkluchayu gipervizor (Hyper-V) dlya snizheniya nagruzki...
bcdedit /set hypervisorlaunchtype off

:: --- 2. Uskorenie protsessa zagruzki (bezopasnyy variant) ---
echo [2/2] Ustanavlivayu taym-aut zagruzki na 5 sekund...
bcdedit /timeout 5

:: --- P.S. Tviki dlya sistemnogo taymera (disabledynamictick i t.d.) ---
:: --- bolee vazhny, chem vse ostal'noe v etom skripte.       ---
:: --- Ubedis', chto ty ikh primenil iz nashego predydushchego skripta. ---

echo.
echo ===          ZAVERSHENO          ===
echo.
echo Parametry zagruzchika uspeshno primeneny.
echo Izmeneniya vstupiat v silu posle perezagruzki kompyutera.
echo.
pause