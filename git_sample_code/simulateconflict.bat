@echo off
call delrepos 
if not exist e:\tmp\ mkdir e:\tmp
cd e:\tmp
if not exist e:\tmp\.git\ git init 


echo Hello World >> hello.txt 
git add hello.txt 
git commit -m "addded hello.txt master" 
echo **** now create bug123 branch and modify hello.txt to make conflict
git checkout -b bug123 

echo \"Hello World!\" > hello.txt 
git add hello.txt 
git commit -m "added hello.txt bug123"  
echo **** Added 1 file(s) hello.txt  to bug123

git checkout master 
echo \"Hello World, Sriram!\" > hello.txt 
git add hello.txt 
git commit -m "modified  hello.txt master"  
echo **** modified 1 file(s) hello.txt  to master
cls 


git merge bug123 

set /p conf="if conflict is show by a gitmerge, resolve conflict and commit. Press any key to continue: " 

cd "E:\01. Code\02. demo_code\git_sample_code"
cls