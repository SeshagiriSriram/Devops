# Getting Started with Prometheus and ELK  

This folder contains samples on setting up ELK and prometheus

## Folder Structure  

```yaml
kubernetes/
│
├── README.md                # This file
├── elk-helm                 # Install ELK using HELM
├── prometheusandgrafana     # Install Prometheus/Grafana using HELM
├── ELK-Stack-Kubernetes     # Install ELK using YAML File
```  

## Sample Dashboard

A sample dashboard can be found under the /docker/prometheusgrafana. Before importing the JSON, make sure to change IP address to reflect the Windows server where the Windows Exporter is running - this is usually a.b.c.d:9182.

- Next run the below  

  ```bash
  helm get values kube-prometheus-stack -n metrics  
  ```

- Edit values.yaml to add an additionalScrape config
- Update helm

  ```bash
  helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack -f values.yaml -n metrics    
  ```

- Import the JSON file
- Correct any errors if any.  
- You should now see your dashboard as shown below

![Sample Windows Metrics](/images/grafana_sample.png)

## ELK Stash Setup

### Elastic Search  

```bash
kubectl create ns logging                # set up namespace

kubectl create -f es-deployment.yaml     # Make the deployment

kubectl create -f es-svc.yaml            # Set up service

```

### Kibana  

```bash
# Do the deployment
kubectl create -f kibana-deployment.yaml
# Point it to ElasticSearch Hosts
kubectl set env deployments/kibana ELASTICSEARCH_HOSTS=http://elasticsearch:9200 -n logging
#Deploy the Service
kubectl create -f kibana-svc.yaml
```

### Logstash  

```bash
# Update Configurations based on logstash.conf
kubectl create configmap log-manual-pipeline --from-file ./logstash.conf  -n logging 
# Do the Deployment
kubectl create -f logstash-deployment.yml
# Do the service
kubectl create -f logstash-svc.yml
# Optional: If you need the API from outside
kubectl create -f logstash-web-svc.yml
```

### FileBeat and Applications  

```bash
# Setup the Filebeat configuration
kubectl create configmap beat-manual-config --from-file ./filebeat.yml -n logging
# Deploy the application
kubectl create -f app-deployment.yml
```

----
