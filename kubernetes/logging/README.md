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
