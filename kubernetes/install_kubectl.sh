curl -LO https://dl.k8s.io/release/v1.31.5/bin/linux/amd64/kubectl
curl -LO https://dl.k8s.io/release/v1.31.5/bin/linux/amd64/kubectl.sha256
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf ./kubectl kubectl.sha256
kubectl version --client
kubectl version --client --output=yaml
