#!/bin/bash
# Call this  script from the directory where this script is located
# usage: ./promservicefwd.sh 2>&1 >/dev/null &
# Forward Prometheus and Grafana services to localhost
kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 -n metrics 
