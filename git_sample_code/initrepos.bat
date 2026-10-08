@echo off
REM Save current directory
set "OLD_DIR=%CD%"
if not exist %~d0\tmp\ mkdir %~d0\tmp
cd /d %~d0\tmp\
if not exist %~d0\tmp\.git\ git init 
echo Empty Repos initialized in %~d0\tmp\
set /p con=Enter any key to continue...
cd /d "%OLD_DIR%"
cls