# Provided as IS - Use at own risk 
if [ ! -f Dockerfile ]; then 
	echo "Dockerfile is required to build the application. Exiting." 
	exit 2 
else 
	echo "Dockerfile exists. OK to proceed" 
fi 
count=`docker network ls | grep -c jenkins` 
if [ ${count} -eq 0 ]; then 
	echo "Creating network jenkins" 
	docker network create jenkins
else
	echo "Not creating network jenkinsi as it already exists" 
fi 
mkdir -p jenkins-docker-certs
mkdir -p jenkins-data
export JENKINS_VERSION=2.512-jdk17
#
# start the docker in Docker container
#
# Why not 2376? ... I have set 2376 on my local docker server instance for secure connection on TCP. 
docker run --name jenkins-docker --restart=on-failure --detach --privileged --network jenkins --network-alias docker  --env DOCKER_TLS_CERTDIR=/certs --volume jenkins-docker-certs:/certs/client  --volume jenkins-data:/var/jenkins_home   --publish 2378:2376  docker:dind
# Create the docker image.. 
docker build -t jenkins-blueocean:${JENKINS_VERSION}  . 
#
# start the Jenkins server
docker run --name jenkins-blueocean --restart=on-failure --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376   --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1   --volume jenkins-data:/var/jenkins_home   --volume jenkins-docker-certs:/certs/client:ro  -v $HOME:/data  -v /tmp:/forcopy --publish 8080:8080 --publish 50000:50000 jenkins-blueocean:${JENKINS_VERSION} 
