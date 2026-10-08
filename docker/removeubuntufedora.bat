@echo off
docker stop fedora 
rem docker rm fedora
for %%a in (1,2,3,4,5) do docker stop ubuntu%%a
rem for %%a in (1,2,3,4,5) do docker rm ubuntu%%a
