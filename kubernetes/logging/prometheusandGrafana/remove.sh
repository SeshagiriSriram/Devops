helm uninstall kube-prometheus-stack prometheus-community/kube-prometheus-stack -n metrics
helm uninstall prometheus-adapter prometheus-community/prometheus-adapter -n metrics

kubectl delete namespace metrics
