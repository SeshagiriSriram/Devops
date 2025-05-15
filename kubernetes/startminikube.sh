# Comment below line if using "rooted" docker
#docker context use rootless 
VM_DRIVER=${1:-"--vm-driver=docker"} 
#For above parameter, e.g. --vm-driver=docker 
# Adapt the below as necessary
MOUNTSTRING="" 
if [ ! -z ${MOUNTDIR} ] ; then 
	MOUNTSTRING="--mount --mount-string="\"${MOUNTDIR}:/hostmount\" 
fi 
#Cruel hack for now since I do not know how to escape/unescape quotes...
#echo minikube start ${VM_DRIVER}  ${MOUNTSTRING}  --container-runtime=containerd --memory 8192  --cpus 4   > /tmp/tmp.sh 
echo minikube start ${VM_DRIVER}  ${MOUNTSTRING}  --memory 8192  --cpus 4   > /tmp/tmp.sh 
chmod +x /tmp/tmp.sh 
#minikube start ${VM_DRIVER}  ${MOUNTSTRING}  --memory 8192  --cpus 4   
/tmp/tmp.sh && rm -f /tmp/tmp.sh  
./enable_addons.sh 
