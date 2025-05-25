CLUSTERNAME=${1:-minikube} 
minikube stop --profile ${CLUSTERNAME} 
echo Minkube cluster ${CLUSTERNAME} has been stopped. 
echo -n "Do you want to delete the cluster also? If yes, please enter Y or y "
read var 
if [ $var = "y" ] || [ $var = "Y" ]; then 
	minikube delete  --profile ${CLUSTERNAME} 
fi 

if  [ -d $HOME/.minikube ] ; then 
   rm -rf $HOME/.minikube
fi 
if  [ -d $HOME/.kube ] ; then 
   rm -rf $HOME/.kube
fi 

