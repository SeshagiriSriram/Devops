clear
echo; echo 
rm -rf ~/learn
mkdir -p ~/learn
(cd ~/learn; /usr/bin/git init .) 
echo -e '\e[38;5;82m Initialized Repository  \e[0m'
echo Hello World > ~/learn/hello.txt 
echo -e '\e[38;5;82m Content => Hello World\e[0m'
(cd ~/learn; git add hello.txt; git commit -m "addded hello.txt main")
echo -e '\e[38;5;82m Added hello.txt in main branch\e[0m'
(cd ~/learn; git checkout -b bug123); 
echo -e '\e[38;5;82m Created bug123 branch. We are modifying hello.txt to simulate a conflict\e[0m'
echo Hello Universe > ~/learn/hello.txt 
echo -e '\e[38;5;82m Content => Hello Universe\e[0m'
(cd ~/learn; git add hello.txt; git commit -m "addded hello.txt bug123")
(cd ~/learn; git checkout main); 
echo Hello World, Sriram > ~/learn/hello.txt 
echo -e '\e[38;5;82m  Content => Hello World, Sriram\e[0m'
(cd ~/learn; git add hello.txt; git commit -m "modified hello.txt main")
echo -e '\e[38;5;82m modified  hello.txt in main branch\e[0m'
(cd ~/learn; git merge bug123) 
if [ $? -ne 0 ]; then 
	echo -e '\e[38;5;214m You should now see a merge conflict error when merging bug123 into main.\e[0m'
	cat ~/learn/hello.txt 
	echo -n "Press any key to edit file..." 
	read -s key 
	vi ~/learn/hello.txt 
	echo -e '\e[38;5;82m Resolved all conflicts.\e[0m'
	(cd ~/learn; git add *; git commit -m "Resolved all Conflicts.") 
	echo -e '\e[38;5;82m All Issues resolved\e[0m'
	(cd ~/learn; git log --oneline) 
	cat ~/learn/hello.txt 
fi
rm -rf ~/learn

