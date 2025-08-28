@echo off
REM Provided as IS - Use at own risk

REM Logging function (inline)
setlocal enabledelayedexpansion

REM Check if Docker is installed
where docker >nul 2>nul
if errorlevel 1 (
    echo [%DATE% %TIME%] Docker is not installed. Please install Docker first.
    exit /b 1
)

REM Check if Dockerfile exists
if not exist Dockerfile (
    echo [%DATE% %TIME%] Dockerfile is required to build the application. Exiting.
    exit /b 2
) else (
    echo [%DATE% %TIME%] Dockerfile exists. OK to proceed
)

REM Check if network exists before creating
docker network ls | findstr /i "jenkins" >nul
if errorlevel 1 (
    echo [%DATE% %TIME%] Creating network jenkins
    docker network create jenkins
) else (
    echo [%DATE% %TIME%] Not creating network jenkins as it already exists
)

REM Create folders for volume mapping if not exist
if not exist jenkins-docker-certs (
    mkdir jenkins-docker-certs
)
if not exist jenkins-data (
    mkdir jenkins-data
)

set JENKINS_VERSION=2.516.2

REM Remove existing containers if present
docker ps -a --format "{{.Names}}" | findstr /i "^jenkins-docker$" >nul
if not errorlevel 1 (
    echo [%DATE% %TIME%] Removing existing jenkins-docker container
    docker rm -f jenkins-docker
)
docker ps -a --format "{{.Names}}" | findstr /i "^jenkins-blueocean$" >nul
if not errorlevel 1 (
    echo [%DATE% %TIME%] Removing existing jenkins-blueocean container
    docker rm -f jenkins-blueocean
)

REM Start the Docker-in-Docker container
docker run --name jenkins-docker ^
  --detach ^
  --privileged ^
  --network jenkins ^
  --network-alias docker ^
  --env DOCKER_TLS_CERTDIR=/certs ^
  --volume jenkins-docker-certs:/certs/client ^
  --volume jenkins-data:/var/jenkins_home ^
  --publish 2378:2376 ^
  docker:dind

REM Build the Jenkins image
docker build -t myjenkins-blueocean:%JENKINS_VERSION% .

REM Start the Jenkins server
docker run --name jenkins-blueocean ^
  --restart=on-failure ^
  --detach ^
  --network jenkins ^
  --env DOCKER_HOST=tcp://docker:2376 ^
  --env DOCKER_CERT_PATH=/certs/client ^
  --env DOCKER_TLS_VERIFY=1 ^
  --volume jenkins-data:/var/jenkins_home ^
  --volume jenkins-docker-certs:/certs/client:ro ^
  --publish 8080:8080 ^
  --publish 50000:50000 ^
  myjenkins-blueocean:%JENKINS_VERSION%
