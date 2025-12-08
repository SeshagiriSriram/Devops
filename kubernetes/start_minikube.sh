#!/bin/bash
set -e
set -o pipefail		
# Comment below line if using "rooted" docker
#docker context use rootless 
CLUSTERNAME=${1:-minikube} 
if [ "$#" -gt 0 ]; then
  shift
fi
VM_DRIVER=${1:-"docker"} 
# TODO: Check if driver is available and valid 
VM_FLAG="--vm-driver=${VM_DRIVER}"

LP=""
if [ "${VM_DRIVER}" = "docker" ]; then 
    LP="--ports=8443:8443"
fi 

if [ -n "${MOUNTDIR}" ]; then
  ARGS=(--mount "--mount-string=${MOUNTDIR}:/hostmount")
  if [ ! -d "${MOUNTDIR}" ]; then
  	echo "Error: Specified Mount/host directory '${MOUNTDIR}' does not exist."
	echo "Minikube cannot be started with given mount option."
	if [ ! -z "${IGNORE_MOUNT_ERROR:+1}" ]; then
		echo "Continuing without mount option as IGNORE_MOUNT_ERROR is set"
		MOUNT_FLAG="--mount=false"
		ARGS=("${MOUNT_FLAG}")	
		else		
		echo "Terminating as IGNORE_MOUNT_ERROR is not set"	
		exit 1
    fi 
  fi
fi
ARGS+=("${VM_FLAG}" "${LP}" "--memory" "8192" "--cpus" "4")
#ARGS+=("${VM_FLAG}" "--memory" "5120" "--cpus" "4")
minikube start "${ARGS[@]}"
echo "Minikube started with args: ${ARGS[*]}"
./enable_addons.sh 
