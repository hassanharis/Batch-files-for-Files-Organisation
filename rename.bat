@echo off
setlocal enabledelayedexpansion

:: Change to the current directory
cd /d "%~dp0"

REM Get the name of the current directory
for %%D in (.) do set CurrentDirName=%%~nxD


REM Rename files starting with SLD
for %%F in (SLD*) do (
    ren "%%F" "SLD-%CurrentDirName%%%~xF"
)

REM Rename files starting with SSR
for %%F in (SSR*) do (
    ren "%%F" "SSR-%CurrentDirName%%%~xF"
)

REM Rename files starting with VC Report
for %%F in ("VC Report*") do (
    ren "%%F" "VC Report-%CurrentDirName%%%~xF"
)

for %%F in (*.txt) do (
    ren "%%F" "%CurrentDirName%%%~xF"
)

for %%F in (NSR*) do (
    ren "%%F" "NSR-%CurrentDirName%%%~xF"
)

for %%F in ("Completion*") do (
    ren "%%F" "Completion Report-%CurrentDirName%%%~xF"
)


for %%F in ("FES*.pdf*") do (
    ren "%%F" "OTDR Report-%CurrentDirName%%%~xF"
)

for %%F in ("PIS*.pdf*") do (
    ren "%%F" "OTDR Report-%CurrentDirName%%%~xF"
)

echo Files have been renamed successfully.


REM 2. Rename folders starting with "FES" or "PIS" to "OTDR"
for /d %%F in (FES* PIS*) do (
    if /i "%%F" neq "OTDR" (
        ren "%%F" "OTDR"
    )
)

REM 3. Move all folders except "OTDR" to the "Pictures" folder
if not exist "Pictures" mkdir "Pictures"
for /d %%F in (*) do (
    if /i "%%F" neq "OTDR" (
        move "%%F" "Pictures\"
    )
)

move "*.jpeg" "Pictures\"
move "*.png" "Pictures\"
move "*.jpg" "Pictures\"

echo Tasks completed.
pause
