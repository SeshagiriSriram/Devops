# Getting Started with Docker
This has 5 parts

1. jenkins
2. lamp-dockercompose
3. multibuild
4. prometheusgrafana
5. samples 

The 1st directory (jenkins) has 1 scripts
1. install_jenkins.sh which is used to build the docker image for jenkins
2. Start jenkins (it does call docker compose up)

Configuration of jenkins is out of scope 

the 2nd directory (lamp-dockercompsr) instantiates 
1. 1 instance of Mysql 
2. 1 instance of default web server with PHP support (if you navigate to this site, you should see index.php being run)
3. 1 instance of PHPMyAdmin

NB: The password is hardcoded into the docker-compose.yml file. This is acceptable in training - in production, the secret will be passed in a different manner 

The 3rd directory (multi-build) is meant to show why and how we use multi-builds. 
To run this, navigate to this directory 
    docker build -f <nameofDockerfile> -t <nameofImage> 
where nameodDockerfile = DockerAll|DockerWith 

NB: 
* DockerAll = no multi-stage build
* DockerWith = with Multi-Stage build

4. prometheusgrafana 
   create and deploy prometheus and grafana with CADVISOR
   Use Default dashboards for grafana

5. Samples
    Demomstration of multi-build (Duplicated perhaps?)
    Simplewebapp 
    Difference between CMD and ENTRYPoint