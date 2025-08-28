@echo off 
REM TODO ADD ERROR HANDLING 
docker stop jenkins-docker 
docker stop jenkins-blueocean 
docker rm jenkins-docker 
docker rm jenkins-blueocean 
docker rmi jenkins-blueocean:2.516.2
docker rmi jenkins/jenkins:2.516.2
docker rmi myjenkins-blueocean:2.516.2
docker rmi docker:dind
docker network rm jenkins 
docker system prune --volumes --force 
