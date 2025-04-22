docker rm -f ansiblemaster
docker rm -f ansiblenode1

docker rmi -f ansiblenode
docker rmi -f ansiblemaster

docker network rm ansible
docker system prune  --volumes -a --force 

echo All done 



