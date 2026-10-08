@echo off
rem if exist e:\tmp\ rmdir /s/q e:\tmp
if not exist %~d0\tmp\ mkdir %~d0\tmp
echo Repos in %~d0\tmp\ removed along with %~d0\tmp\ directory
set /p con=Enter any key to continue...
rem cd "E:\01. Code\02. demo_code\git_sample_code"
cls