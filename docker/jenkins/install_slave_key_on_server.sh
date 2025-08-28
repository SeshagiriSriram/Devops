cd /var/jenkins_home/.ssh
scp ubuntu@jenkins_slave:/home/ubuntu/.ssh/id_rsa.pub  id_remote
cat id_remote >> authorized_keys
chmod 600 authorized_keys
rm id_remote
