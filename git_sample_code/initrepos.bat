@echo off
if not exist e:\tmp\ mkdir e:\tmp
cd e:\tmp
if not exist e:\tmp\.git\ git init 
echo Empty Repos initialized in e:\tmp
rem set /p con=Enter any key to continue...
cd "E:\01. Code\02. demo_code\git_sample_code"
cls