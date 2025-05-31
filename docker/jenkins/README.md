# Notes about Jenkins Install

NB: You could either install jenkins using 

- install_jenkins.sh 
- just use the docker compose file e.g. __*docker compose up -d*__ 


The Dockerfile provided is huge and needs to be trimmed out. 
It does provide some conveniences like

- Pre-scanned entries for github.com and gitlab.com 
- Added utilities - meant **strictly** for learning purposes

Things that need to be done include 

- Log into Jenkins and get the inital password for configuration 
- Set up jenkins - standard Jenkins setup .... 
  - Set up User name and SSH Credentials is one example
  - Adding/configuring plugins is another 
  - User Setup 
  - Themes... blah blah.... customizations 
- Create SSH keys on jenkins and integrate with Github/gitlab. 

Additional credential helpers are provided. A GPG2 key has to be created and initialized before **docker login** can be used securely in any pipeline.