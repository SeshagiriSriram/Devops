#!/bin/bash
set -e
# Variables
CSR_NAME="admin-csr"
USER_NAME="admin"
CLUSTER_NAME="$(kubectl config view --minify -o jsonpath='{.clusters[0].name}')"
# modify this to your Windows User Name 
WINUSER_NAME="sesha"
WINDIR=/mnt/c/users/${WINUSER_NAME}/.kube 

# 1. Generate private key
openssl genrsa -out ${USER_NAME}.key 2048
# 2. Generate CSR without system:masters group
openssl req -new -key ${USER_NAME}.key -out ${USER_NAME}.csr -subj "/CN=${USER_NAME}"
# 3. Create Kubernetes CSR object YAML and apply
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: $CSR_NAME
spec:
  groups:
  - system:authenticated
  request: $(cat ${USER_NAME}.csr | base64 | tr -d '
')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF

# 4. Approve CSR
kubectl certificate approve $CSR_NAME
# 5. Extract signed certificate
kubectl get csr $CSR_NAME -o jsonpath='{.status.certificate}' | base64 --decode > ${USER_NAME}.crt
# 6. Create ClusterRoleBinding for admin user
kubectl get clusterrolebinding admin-user-binding >/dev/null 2>&1 || 
kubectl create clusterrolebinding admin-user-binding --clusterrole=cluster-admin --user=$USER_NAME
# 7. Copy files over to windows 
mkdir -p ${WINDIR} 
cp ~/.minikube/ca.crt ${WINDIR} 
cp ${USER_NAME}.crt  ${WINDIR} 
cp ${USER_NAME}.key  ${WINDIR} 

# 8. Configure kubectl context
echo "@echo off 
kubectl config set-cluster minikube --certificate-authority=ca.crt --server=https://127.0.0.1:8443
kubectl config set-credentials $USER_NAME --client-certificate=${USER_NAME}.crt --client-key=${USER_NAME}.key
kubectl config set-context ${USER_NAME}-context --cluster=$CLUSTER_NAME --user=$USER_NAME
kubectl config use-context ${USER_NAME}-context
" > ${WINDIR}/install.bat 
echo "Admin user setup complete. Switch to Windows and run '${WINDIR}'/install.bat to start using the ${USER_NAME}-context. "

