# !/bin/bash
set -e 
#  Install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
# https://kubernetes.io/docs/setup/release/version-skew-policy/#kubectl
# https://kubernetes.io/docs/tasks/tools/#kubectl
# The version of kubectl must be within one minor version of the control plane
# see also install_minikube.sh and above links
# update the command below to change the version of kubectl to install 
# curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
if [ $? -eq 0 ]; then
    echo "kubectl checksum verification succeeded"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm -rf ./kubectl kubectl.sha256
    kubectl version --client
    kubectl version --client --output=yaml
else
    echo "kubectl checksum verification failed"
    exit 1
fi
