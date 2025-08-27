# !/bin/bash
# Forwarding ports for phpMyAdmin and Apache
# Move the 2>&1 & to the end of each line if you want to see the logs in the terminal
# Alternativel remove these from the file and run this script in the background with ./fwd.sh 2>&1  >/dev/null & 
# Port 9090 is for phpMyAdmin
# Port 9084 is for Apache
# You can change these ports if they are already in use on your local machine
# TODO: Change  the ports to be passed as arguments to the script
# TODO: Add checks to see if the ports are already in use on the local machine
# TODO: Add checks to see if the port-forwarding is already running
# TODO: Add a way to stop the port-forwarding processes
# TODO: update README.md with instructions to use this script

kubectl port-forward svc/lamp 9090:80 -n lampdemo 2>&1 & 
kubectl port-forward svc/lamp-apache 9084:80 -n lampdemo 2>&1 &  
