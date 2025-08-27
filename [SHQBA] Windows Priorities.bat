@echo off
Title Game Priority Booster
color 0B

:: ВАЖНО: Замени "game.exe" на реальное имя процесса твоей игры
set "game_process_name=game.exe"

echo.
echo ===      USKORITEL' IGROVOGO PROTSESSA      ===
echo.
echo Ishchu protsess %game_process_name%...
echo.

:loop
wmic process where name="%game_process_name%" get ProcessID > nul 2>&1
if %errorlevel%==0 (
    echo Protsess %game_process_name% nayden!
    wmic process where name="%game_process_name%" CALL setpriority "high"
    echo Ustanovlen vysokiy prioritet.
    goto :end
) else (
    echo Protsess igry ne nayden. Povtornaya proverka cherez 5 sekund...
    timeout 5 > nul
    goto :loop
)

:end
echo.
echo Skript zavershil rabotu.
pause