#!/bin/bash
# This script stops and removes Jenkins Docker containers, images, and associated resources.
# BE CAREFUL when running this script as it will remove Docker resources.
# Usage: ./stop_jenkins.sh
# Environment Variable: JENKINS_VERSION (default: 2.513)
set -e
docker stop jenkins-docker 
docker stop jenkins-blueocean 
docker rm jenkins-docker 
docker rm jenkins-blueocean 
docker rmi jenkins-blueocean:${JENKINS_VERSION:-2.513}
docker rmi jenkins/jenkins:${JENKINS_VERSION:-2.513}
docker rmi docker:dind
# BE CAREFUL... 
docker network rm jenkins 
docker system prune --volumes --force 
