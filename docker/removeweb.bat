@echo off
for %%a in (1,2,3,4,5) do docker stop webapp%%a
rem for %%a in (1,2,3,4,5) do docker rm ubuntu%%a
