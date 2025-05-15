helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace metrics
#helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 62.5.1 -n metrics
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack  -n metrics
helm install prometheus-adapter prometheus-community/prometheus-adapter --set prometheus.url=http://kube-prometheus-stack-prometheus.metrics.svc.cluster.local -n metrics
helm ls

