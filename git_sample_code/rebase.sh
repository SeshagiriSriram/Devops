clear
echo; echo 
rm -rf ~/learn
mkdir -p ~/learn
(cd ~/learn; /usr/bin/git init .) 
(cd ~/learn; dir > a.txt;/usr/bin/git add a.txt ;/usr/bin/git commit -m "Added a.txt main") 
(cd ~/learn; dir > b.txt;/usr/bin/git add b.txt ;/usr/bin/git commit -m "Added b.txt main") 
(cd ~/learn; dir > c.txt;/usr/bin/git add c.txt ;/usr/bin/git commit -m "Added c.txt main") 
(cd ~/learn; dir > d.txt;/usr/bin/git add d.txt ;/usr/bin/git commit -m "Added d.txt main") 
(cd ~/learn; dir > e.txt;/usr/bin/git add e.txt ;/usr/bin/git commit -m "Added e.txt main") 
echo -e '\e[38;5;82m Added 5 files a.txt, b.txt, c.txt, d.txt, e.txt  to main \e[0m'
(cd ~/learn; /usr/bin/git -c core.pager=more log --oneline --graph --decorate --all)
read -s key 
(cd ~/learn; /usr/bin/git checkout -b bug123) 
echo -e '\e[38;5;82m Created a branch bug123 \e[0m'
(cd ~/learn; dir > f.txt;/usr/bin/git add f.txt ;/usr/bin/git commit -m "Added f.txt bug123") 
(cd ~/learn; dir > g.txt;/usr/bin/git add g.txt ;/usr/bin/git commit -m "Added g.txt bug123") 
echo -e '\e[38;5;82m Added 2 files f.txt, g.txt to bug123 \e[0m'
(cd ~/learn; /usr/bin/git -c core.pager=more log --oneline --graph --decorate --all) 
read -s key 
(cd ~/learn; /usr/bin/git checkout main) 
(cd ~/learn; /usr/bin/git -c core.pager=more log --oneline --graph --decorate --all) 
echo -e '\e[38;5;82m Switched back to main \e[0m'
(cd ~/learn; dir > h.txt;/usr/bin/git add h.txt ;/usr/bin/git commit -m "Added h.txt main") 
echo -e '\e[38;5;82m **** main now has a new HEAD \e[0m'
(cd ~/learn; /usr/bin/git -c core.pager=more log --oneline --graph --decorate --all) 
read -s key 
(cd ~/learn; /usr/bin/git checkout bug123; /usr/bin/git rebase main)
(cd ~/learn; /usr/bin/git -c core.pager=more log --oneline --graph --decorate --all) 
echo -e '\e[38;5;82m **** Did a rebase of bug123 to point to main new HEAD\e[0m'
(cd ~/learn; /usr/bin/git checkout main) 
(cd ~/learn; git -c core.pager=more branch) 
(cd ~/learn; /usr/bin/git merge  --ff --no-edit bug123) 
(cd ~/learn; /usr/bin/git -c core.pager=more log --oneline --graph --decorate --all) 
echo -e '\e[38;5;82m **** Merged main with bug123 \e[0m'
echo -e '\e[38;5;214m  See how the graph is linear  \e[0m'
(cd ~/learn; /usr/bin/git branch -d bug123)
(cd ~/learn; git -c core.pager=more branch) 
echo -e '\e[38;5;82m **** Deleted branch = bug123  \e[0m'
rm -rf ~/learn
