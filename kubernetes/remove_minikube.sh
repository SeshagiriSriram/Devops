CLUSTERNAME=${1:-minikube} 
minikube stop --profile ${CLUSTERNAME} 
minikube delete --profile ${CLUSTERNAME} 
sudo apt-get purge -y minikube && sudo apt-get autoremove -y 
if  [ -d $HOME/.minikube ] ; then 
   rm -rf $HOME/.minikube
fi 
if  [ -d $HOME/.kube ] ; then 
   rm -rf $HOME/.kube
fi 

