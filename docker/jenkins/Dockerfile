ARG JENKINS_VERSION=2.516.2

FROM jenkins/jenkins:${JENKINS_VERSION}
ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y lsb-release gnupg2 && \
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y docker-ce-cli && \
    apt-get remove --purge -y lsb-release  && apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow docker-commons credentials-binding"
WORKDIR /var/jenkins_home
HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
CMD curl -fs http://localhost:8080/login || exit 1
