# Getting Started with Minikube

This repository contains information on how to get started with Kubernetes.  

## Please note the following notes and caveats

> 1. Ubuntu 20 through 24 on VM and WSL2  
> 2. No corresponding Windows Batch files are present and are left as an excersise to do  

## How to Use this  

1. navigate to this folder and run
   - ```./start_minikube.sh [cluster=minikube]```  

2. You may want to first review this file and make change as needed for your environment.
3. The defaults should be enough to install Prometheus and Grafana to moniton this cluster

There are additional files which are meant for

- Installing HELM
- Installing Kubectl
- Installing Minikube itself

- Stopping and Removing Minikube

## Folder Structure  

```bash  
kubernetes/
│
├── README.md                # This file
├── start_minikube.sh        # Script to start Minikube cluster
├── install_minikube.sh      # Script to nstall minikube
├── install_helm.sh          # Script to install Helm
├── install_kubectl.sh       # Script to install Kubectl
├── stop_minikube.sh         # Script to stop and remove Minikube
├── deploy/                  # Samples for Depoying applications
├── logging/                 # Setting up ELK and Prometheus/Grafana in Kubernetes  
```  

## Notes on start_minikube.sh  

1. The usage of the script is: `./start_minikube.sh [clustername=minikube]|[drivername=docker]`
2. If no cluster is provided, the cluster name defaults to **minikube**
3. if cluster is provided and driver is not provided, the driver defaults to **docker**

## Other Notes

See the README.md under the logging subfolder on instructions on how to use a sample provided dashboard.  

---
