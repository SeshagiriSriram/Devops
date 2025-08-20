@echo off
cls 
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
dir  > d.txt 
git add d.txt 
git commit -m "Added d.txt master"
dir  > e.txt 
git add e.txt 
git commit -m "Added e.txt master"


echo Added 5 files a.txt, b.txt, c.txt, d.txt, e.txt  to master
git checkout -b bug123

dir > f.txt 
git add f.txt 
git commit -m "Added f.txt bug123"
dir > g.txt 
git add g.txt 
git commit -m "Added g.txt bug123"
echo Added 2 files f.txt, g.txt to bug123

git checkout master 
dir > h.txt 
git add h.txt 
git commit -m "added h.txt to master" 
echo **** master now has a new head..

git checkout bug123 
git rebase master 
echo Did a rebase of bug123 to point to masters new head 
git checkout master 
git merge  --ff --no-edit bug123
echo Merged bug123 with master
git branch -d bug123

git log --oneline --graph --decorate --all 
echo see how the graph is linear

set /p con=Enter any key to continue...
cd "E:\01. Code\02. demo_code\git_sample_code"
delrepos 