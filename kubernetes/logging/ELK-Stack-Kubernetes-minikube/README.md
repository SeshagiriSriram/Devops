# Sample ELK install (single node cluster) using YAML files  

## How to

Run the following in sequence. Be sure to review yaml files before doing so. Enjoy.  

```bash
# Create a namespace
kubectl create ns logging
# Deploy ElasticSearch 
kubectl create -f es-deployment.yaml
kubectl create -f es-svc.yaml
# Minikube specific forward
./esfwd.sh 2>&1 >/dev/null &
#Deploy Kibana
kubectl create -f kibana-deployment.yaml
kubectl create -f kibana-svc.yaml
# Minikube specific forward
./kibfwd.sh 2>&1 >/dev/null &
#CreTE LOGSTASH.CONF files
kubectl create configmap log-manual-pipeline --from-file ./logstash.conf  -n logging
#Deploy logstash
kubectl create -f logstash-deployment.yml
kubectl create -f logstash-svc.yml
#Configure FileBreat
kubectl create configmap beat-manual-config --from-file ./filebeat.yml -n logging
#Deploy sample applications that will ship logs to Logstash. 
kubectl create -f app-deployment.yml
```  
