@echo off
REM Display a message and wait for 3 seconds
echo Deleting all .zip files in the current directory in 3 seconds...
:: Change to the current directory
cd /d "%~dp0"

REM Delete all .zip files in the current directory
del *.zip
del *.rar

REM Confirmation message
echo All .zip files have been deleted.
pause