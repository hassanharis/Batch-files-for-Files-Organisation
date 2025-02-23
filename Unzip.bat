@echo off
setlocal enabledelayedexpansion

:: Change to the current directory
cd /d "%~dp0"

:: Check if unzip tool is available
where /q tar
if %errorlevel% neq 0 (
    echo tar tool is required but not found. Please install it and ensure it's in your PATH.
    pause
    exit /b
)

:: Loop through each ZIP file in the directory
for %%F in (*.zip) do (
    :: Get the base name of the ZIP file (without the extension)
    set "zipName=%%~nF"

    :: Create a directory with the same name as the ZIP file
    mkdir "!zipName!"

    :: Extract the ZIP file into the newly created directory
    echo Extracting %%F to folder !zipName!...
    tar -xf "%%F" -C "!zipName!"
    if %errorlevel% neq 0 (
        echo Failed to extract %%F
    ) else (
        echo Successfully extracted %%F
    )
)

endlocal
echo Done!
pause
