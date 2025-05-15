minikube addons enable metrics-server
minikube addons enable default-storageclass
minikube addons enable storage-provisioner
minikube addons enable yakd 2>&1 >/dev/null 
#minikube addons enable headlamp 2>&1 >/dev/null  
#./yakd.sh 2>&1 >/dev/null &  
# ./headlamp.sh 2>&1 >/dev/null & 
echo Minikube started. Run yakd.sh and  headlamp.sh if you want to use yakd or headlamp as dashboards 
