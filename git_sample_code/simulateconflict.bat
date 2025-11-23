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

echo Hello World! > hello.txt 
git add hello.txt 
git commit -m "added hello.txt bug123"  
echo **** Added 1 file(s) hello.txt  to bug123

git checkout master 
echo Hello World, Sriram! > hello.txt 
git add hello.txt 
git commit -m "modified  hello.txt master"  
echo **** modified 1 file(s) hello.txt  to master
cls 


git merge bug123 
set /p conf="if conflict is show by a gitmerge, resolve conflict and commit. Press any key to continue: " 
set /p conf2="Press any key to edit and resolve the conflict". 
notepad e:\tmp\hello.txt 
cd e:\tmp
git add hello.txt 
git commit -m "Merged conflict" 
git log --oneline 
set /p conf3="If all was ok, you would see the merge conflict work just fine and commit should work". 


cd "E:\01. Code\02. demo_code\git_sample_code"
call delrepos 
cls