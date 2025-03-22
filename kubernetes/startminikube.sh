# Comment below line if using "rooted" docker
#docker context use rootless 
# Adapt the below as necessary
minikube start --vm-driver=docker --container-runtime=containerd --memory 6144 --cpus 4 --mount-string="/home/sidkalpop:/data" --mount  
minikube addons enable metrics-server
minikube addons enable default-storageclass
minikube addons enable storage-provisioner
# a more
#minikube start --vm-driver=docker --container-runtime=containerd --mount-string="/home/demouser:/data" --mount  --memory 10000 --cpus 4
#minikube addons enable metrics-server
#minikube addons enable default-storageclass
#minikube addons enable storage-provisioner
