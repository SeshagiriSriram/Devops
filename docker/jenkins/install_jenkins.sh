#!/bin/bash
# Provided as IS - Use at own risk
set -e  # Exit on any error
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') $@"; }

if ! command -v docker &> /dev/null; then
    log "Docker is not installed. Please install Docker first."
    exit 1
fi

if [ ! -f Dockerfile ]; then 
	log "Dockerfile is required to build the application. Exiting." 
	exit 2 
else 
	log "Dockerfile exists. OK to proceed" 
fi 
count=$(docker network ls | grep -c jenkins) 
if [ "${count}" -eq 0 ]; then 
	log "Creating network jenkins" 
	docker network create jenkins
else
	log "Not creating network jenkins as it already exists" 
fi 

# Create required directories. The -p flag ensures no error if they already exist 
mkdir -p jenkins-docker-certs
mkdir -p jenkins-data
export JENKINS_VERSION=${JENKINS_VERSION:-2.516.2}

# Remove existing containers if present
if docker ps -a --format '{{.Names}}' | grep -q '^jenkins-docker$'; then
    log "Removing existing jenkins-docker container"
    docker rm -f jenkins-docker
fi
if docker ps -a --format '{{.Names}}' | grep -q '^jenkins-blueocean$'; then
    log "Removing existing jenkins-blueocean container"
    docker rm -f jenkins-blueocean
fi

#
# start Docker-in-Docker container
docker run --name jenkins-docker \
  --restart=on-failure \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2378:2376 \
  docker:dind
# Create the docker image.. 
docker build --rm -t jenkins-blueocean:"${JENKINS_VERSION}"  .  

#
# start the Jenkins container 
docker run --name jenkins-blueocean \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  -v "$HOME":/data \
  -v /tmp:/forcopy \
  --publish 8080:8080 \
  --publish 50000:50000 \
  jenkins-blueocean:"${JENKINS_VERSION}" 
