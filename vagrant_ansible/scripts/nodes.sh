apt-get update && apt-get install -y curl sudo openssh-server
useradd -ms /bin/bash ansible
#passwd -d ansible
echo 'ansible:ansible' | chpasswd 
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
mkdir -p /var/run/sshd && mkdir -p /run/sshd 
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
#ssh-keygen -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key && \
apt-get clean && rm -rf /var/lib/apt/lists/*
#CMD ["/usr/sbin/sshd", "-D"]
#EXPOSE 22 

