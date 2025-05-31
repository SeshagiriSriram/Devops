# Installation of Docker 

See the parent directory script(s) for information on setting up docker on Ubuntu 24.04 

- install_docker.sh 
- install_rootless_docker.sh 

## If you choose Windows 
Docker is most easily installed with Docker Desktop. We do however recommend that 
- Install Docker on Ubuntu 24.04 (WSL2)
- Install Docker.exe and Docker-Desktop.exe on Windows 
- Configure Docker on Ubuntu to create certificates and expose docker to listen on port 2376 (2375 if you choose not to install Docker securely) 
- Configure Windows to set DOCKER_HOST to connect to Docker Engine on WSL2 Ubuntu 

# Getting Started with Docker

This has 4 directories (Multi-build has been moved to samples) 

1. jenkins
2. lamp-dockercompose
3. prometheusgrafana
4. samples 

The 1st directory (jenkins) has 1 script(s)
1. install_jenkins.sh which is used to build the docker image for jenkins

NB: for windows, use install_jenkins.bat 


Configuration of jenkins is out of scope 

the 2nd directory (lamp-dockercompsr) instantiates 
1. 1 instance of Mysql 
2. 1 instance of default web server with PHP support (if you navigate to this site, you should see index.php being run)
3. 1 instance of PHPMyAdmin

NB: The password is hardcoded into the docker-compose.yml file. This is acceptable in training - in production, the secret will be passed in a different manner 

3. prometheusgrafana 
   create and deploy prometheus and grafana with CADVISOR
   Use Default dashboards for grafana

4. Samples
    Demomstration of multi-build 
    Simplewebapp 
    Difference between CMD and ENTRYPoint

The examples for multi-build (in the samples folder) is meant to show why and how we use multi-builds. 
To run this, navigate to this directory 
    docker build -f <nameofDockerfile> -t <nameofImage> 
where nameodDockerfile = DockerAll|DockerWith 

NB: 
* DockerAll = no multi-stage build
* DockerWith = with Multi-Stage build
