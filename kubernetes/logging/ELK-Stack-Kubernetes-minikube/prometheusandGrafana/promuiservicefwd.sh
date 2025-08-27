#!/bin/bash
# Call this  script from the directory where this script is located
# usage: ./promservicefwd.sh 2>&1 >/dev/null &
# Forward Prometheus and Grafana services to localhost
# NB: This script will not work as Prometheus UI service is not exposed outside the cluster
kubectl port-forward svc/kube-prometheus-stack-prometheus 9090:9090 -n metrics 
