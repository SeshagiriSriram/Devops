docker stop jenkins-docker 
docker stop jenkins-blueocean 
docker rm jenkins-docker 
docker rm jenkins-blueocean 
# BE CAREFUL... 
docker network rm jenkins 
