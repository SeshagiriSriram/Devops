# A simplistic approach to build ansible master node and client

1. Step 01:

    ```bash
    # build the Ansible Server image 
    docker build -f DockerfileAnsible -t ansible-docker . 
    # build the Ansible managed Nodes
    docker build -f DockerfileAnsibleNode -t ansible-node . 
    # now start the nodes
    docker compose up -d 
    # add keys from nodes to master
    docker exec -it ansible_control /bin/bash
    ssh-keyscan -H ansible_node1 >> $HOME/.ssh/known_hosts 
    # running inside docker
    ssh-keyscan -H ansible_node2 >> $HOME/.ssh/known_hosts 
    #running inside docker
    ssh-keyscan -H ansible_node3 >> $HOME/.ssh/known_hosts # running inside docker
    ```

2. Step 02:

    - You will need to create a user ansible if not already created and set its password in the first time on each node e.g. usage:

    ```bash
    docker exec -it ansible_node1 /bin/bash 
    sudo bash 
      passwd ansible
      exit
    exit 
    #[Repeat for ansible_node2, ansible_node3.....]
    ```

3. Step 03:

    - Next Connect from Ansible-master to each off the node
      e.g usage

    ```bash
    # docker exec -it controlnode /bin/bash 
    ssh ansible@ansible_node1
    #[ you will be asked to enter password ] 
    ssh-copy-id ansible@ansible_node1
    #[ you will be asked to enter password ] 
    ssh ansible@ansible_node1
    #[no password will be required now] 
    #[Repeat for ansible_node2, ansibleb_node3... ]
    ```

    The usage is you do a docker exec to the master node and ssh-copy-id its public key to nodes for user ansible.
    Then corresponding ssh's will not require password and the master node can be used to run playbooks on the nodes

4. Step 04:

    - Add inventory file
    - login to control node

    ```bash
     docker exec -it controlnode /bin/bash
     # create folder and files as normal user
     sudo bash 
     # as root
         mkdir -p /etc/ansible/
         touch /etc/ansible/hosts
         echo ansible_node1 >> /etc/ansible/hosts
         echo ansible_node2 >> /etc/ansible/hosts
         echo ansible_node3 >> /etc/ansible/hosts
         chown -R ansible /etc/ansible
         exit
    exit
    ```
