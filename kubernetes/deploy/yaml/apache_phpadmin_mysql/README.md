# Deploy Apache/PHPMyAdmin/MYSQL using YAML

## Meant as a starter on setting up  

- Mysql 8.0
- PHPMyAdmin
- Apache2 with PHP 8.2

and teaching both good and bad practices. This is meant as an easy starting point for Kubernetes/MiniKube.

You start with

- cloning this repos (of course)
- navigating to PHPMYADMIN_MYSQL and running **kubectl apply -k ./**
- running **minikube service lamp**
- navigating to APACHE_MYQL and running **kubectl apply -k ./**
- running **minikube service lamp**

Open both service URLs in browser to see PHPMyAdmin and Apache+PHP server in action.
Details for user names/password have been shared separately.  

An alternative to doing this is to

- Navigate to the folder called **combined**
- run the script ```./start.sh```
- this uses kustomization to create the namespace also in one go.
