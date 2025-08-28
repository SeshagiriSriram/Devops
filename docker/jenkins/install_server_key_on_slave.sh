cd /var/jenkins_home/.ssh
scp id_rsa.pub ubuntu@jenkins_slave:/home/ubuntu/.ssh/id_remote
ssh ubuntu@jenkins_slave "cat /home/ubuntu/.ssh/id_remote >>  /home/ubuntu/.ssh/authorized_keys"
ssh ubuntu@jenkins_slave "chmod 600 /home/ubuntu/.ssh/authorized_keys"
ssh ubuntu@jenkins_slave "rm /home/ubuntu/.ssh/id_remote"
