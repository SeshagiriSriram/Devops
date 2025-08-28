# Sample ELK install (single node cluster) using YAML files  

## 🛠 Prerequisites

- Kubernetes cluster access with `kubectl` configured  
- Required YAML manifests:
  - `es-deployment.yaml`, `es-svc.yaml`
  - `kibana-deployment.yaml`, `kibana-svc.yaml`
  - `logstash-deployment.yml`, `logstash-svc.yml`
  - `app-deployment.yml`
- Config files:
  - `logstash.conf`
  - `filebeat.yml`
- Port-forwarding scripts:
  - `esfwd.sh`, `kibfwd.sh`

---

## 🚀 Step-by-Step Deployment

Run the following in sequence. Be sure to review yaml files before doing so. Enjoy.  

```bash
# reate a namespace
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
#Create LOGSTASH.CONF files
kubectl create configmap log-manual-pipeline --from-file ./logstash.conf  -n logging
#Deploy logstash
kubectl create -f logstash-deployment.yml
kubectl create -f logstash-svc.yml
#Configure FileBreat
kubectl create configmap beat-manual-config --from-file ./filebeat.yml -n logging
#Deploy sample applications that will ship logs to Logstash. 
kubectl create -f app-deployment.yml
```  
