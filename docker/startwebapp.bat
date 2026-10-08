@echo off 
set /a c=2080
setlocal ENABLEDELAYEDEXPANSION
FOR %%A IN (1,2,3,4,5) DO (
docker run --rm --name webapp%%A -itd -p !c!:80 mywebapp
set /a c=c+1
)
endlocal 