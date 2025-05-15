kubectl delete clusterrolebinding headlamp-admin

kubectl -n kube-system create serviceaccount headlamp-admin
kubectl create clusterrolebinding headlamp-admin --serviceaccount=kube-system:headlamp-admin --clusterrole=cluster-admin

kubectl create token headlamp-admin -n kube-system 2>&1 | tee  $HOME/headlamptoken.txt 
kubectl port-forward svc/headlamp 4500:80 -n headlamp 2>&1 

echo Headlamp token created under $HOME/headlamptoken.txt 
