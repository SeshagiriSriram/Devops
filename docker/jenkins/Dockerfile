ARG JENKINS_VERSION=2.512-jdk17
FROM jenkins/jenkins:${JENKINS_VERSION} 
ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN apt-get update && apt-get install --no-install-recommends -y curl lsb-release gnupg2 pass rng-tools jq && apt-get clean 
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc  https://download.docker.com/linux/debian/gpg  && curl -L https://github.com/docker/docker-credential-helpers/releases/download/v0.8.2/docker-credential-pass-v0.8.2.linux-amd64 -o /usr/local/bin/docker-credential-pass && chmod +x /usr/local/bin/docker-credential-pass
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install --no-install-recommends -y docker-ce-cli sudo && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && apt-get  clean 
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
RUN mkdir -p /var/jenkins_home/.ssh && chmod 700 /var/jenkins_home/.ssh &&  ssh-keyscan github.com > /var/jenkins_home/.ssh/known_hosts && ssh-keyscan gitlab.com >> /var/jenkins_home/.ssh/known_hosts
WORKDIR /var/jenkins_home 

