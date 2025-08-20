@echo off
if not exist e:\tmp\ mkdir e:\tmp
cd e:\tmp
if not exist e:\tmp\.git\ git init 

dir > a.txt 
git add a.txt 
git commit -m "Added a.txt master"
dir > b.txt 
git add b.txt 
git commit -m "Added b.txt master"
dir  > c.txt 
git add c.txt 
git commit -m "Added c.txt master"

echo Added 3 files a.txt, b.txt, c.txt to master
git log --oneline --graph --decorate --all 
git checkout -b bug123

dir > d.txt 
git add d.txt 
git commit -m "Added d.txt bug123"
dir > e.txt 
git add e.txt 
git commit -m "Added e.txt bug123"

echo Added 2 files d.txt, e.txt to bug123
git checkout master
git merge bug123
echo Merged bug123 with master
git branch -d bug123 

git log --oneline --graph --decorate --all 


set /p con=Enter any key to continue...
cd "E:\01. Code\02. demo_code\git_sample_code"
delrepos
