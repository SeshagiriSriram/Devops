apt-get update && apt-get install -y sudo curl vim python3 python3-pip 
pip install --upgrade pip && apt-get update 
apt-get install -y ansible
useradd -ms /bin/bash ansible  &&  echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
apt-get clean && rm -rf /var/lib/apt/lists/*
echo 'ansible|ansible' | chpasswd 
#passwd -d ansible 
mkdir -p /home/ansible/.ssh
chmod 777 /home/ansible/.ssh 
su -c "ssh-keygen -q -t rsa -b 4096 -N '' -f /home/ansible/.ssh/id_rsa" ansible
ls -la /home/ansible/.ssh 
chmod 700 /home/ansible/.ssh 
chmod 600 /home/ansible/.ssh/id_rsa
chmod 644 /home/ansible/.ssh/id_rsa.pub
chown -R ansible /home/ansible
echo "Done"

