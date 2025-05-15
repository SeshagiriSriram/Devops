pkill -9 -f port-forward
kubectl delete -k control/
kubectl delete -f base/namespace.yaml 
