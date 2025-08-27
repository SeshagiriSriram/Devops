echo `kubectl get secret kube-prometheus-stack-grafana -o jsonpath="{.data.admin-password}" -n metrics` | base64 --decode; echo 
