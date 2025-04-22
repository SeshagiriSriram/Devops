
docker rm -f ansiblemaster
docker rm -f ansiblenode1
docker network rm ansible
docker system prune  --force 

docker network create ansible
echo Network created 

docker build  -f  DockerfileAnsible  -t ansiblemaster  . 
docker build -f  DockerfileAnsibleNode  -t ansiblenode . 

 echo Docker images built. 

docker run --name ansiblenode1 -itd  --network ansible  --publish 8080:80 ansiblenode
docker run --name ansiblemaster -itd  --network ansible  ansiblemaster

docker cp install.yaml ansiblemaster:/tmp
docker cp remove.yaml ansiblemaster:/tmp

docker cp ansiblemaster:/home/ansible/.ssh/id_rsa.pub . 
docker cp id_rsa.pub ansiblenode1:/home/ansible/.ssh/authorized_keys
echo Copied files 
docker exec -it ansiblenode1 chown -R ansible:ansible /home/ansible/.ssh 
docker exec -u ansible -it ansiblenode1 chmod 744 /home/ansible/.ssh/authorized_keys 
docker exec -u ansible -it ansiblenode1 chmod 700 /home/ansible/.ssh
docker exec -u ansible -it ansiblenode1 chmod 600 /home/ansible/.ssh/id_rsa
docker exec -u ansible -it ansiblenode1 chmod 644 /home/ansible/.ssh/id_rsa.pub 
echo Changed permissions
echo [web] > hosts
echo ansiblenode1 >> hosts
docker exec -it ansiblemaster sh -c "ssh-keyscan ansiblenode1 > /home/ansible/.ssh/known_hosts"
docker exec -it ansiblemaster sh -c "sudo mkdir -p /etc/ansible && sudo chown -R ansible:ansible /etc/ansible" 
docker cp hosts ansiblemaster:/etc/ansible/hosts
rm -f hosts
rm -f id_rsa.pub
echo Created Host file 
docker exec -it ansiblemaster sh -c "ssh ansible@ansiblenode1 ls -la /home/ansible" 
echo Verification over... 
docker system prune  --force 
echo Copied known hosts 

echo All done 



