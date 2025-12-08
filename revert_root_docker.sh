# This is very rudimentary and no error checks. Use at your own risk 
docker rm -f $(docker ps -qa) 2>&1 >/dev/null 
docker rmi -f $(docker ps -qa)  2>&1 >/dev/null 
systemctl --user stop docker 2>&1 >/dev/null 
systemctl --user disable  docker 2>&1 >/dev/null 
sudo loginctl disable-linger $(whoami)
rm -rf $HOME/.config 
rm -rf $HOME/.local/share/docker
rm -rf $HOME/.docker  
rm -rf $HOME/bin
rm -rf $HOME/.local/share/docker
c=$(grep -c '^#.*#ROOTLESS' $HOME/.bashrc) 
if [ ${c} -le 0 ]; then 
	sed -i '/ROOTLESS DOCKER/s/^/#/' $HOME/.bashrc 
fi 
if [ -f /usr/bin/docker ]; then 
	echo "Already on root docker" 
else
	./install_docker.sh 
fi 
echo "All done. Please log out and log back to see changes" 
