# Getting Started with Minikube

1. navigate to this folder and run
   - ```./start_minikube.sh [cluster=minikube]```  

2. You may want to first review this file and make change as needed for your environment.
3. The defaults should be enough to install Prometheus and Grafana to moniton this cluster

There are additional files which are meant for
a. Installing HELM
b. Installing Kubectl
c. Stopping and Removing Minikube

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
