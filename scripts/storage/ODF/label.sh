#!/bin/bash
if [[ "$#" -ne 2 ]]
then
	echo "Usage: $0 add/del <node>"
	exit 1
fi

ACTION=$1
NODE=$2

if [[ "$ACTION" == "add" ]]
then 
	oc label nodes $NODE cluster.ocs.openshift.io/openshift-storage=''
else
	oc label nodes $NODE cluster.ocs.openshift.io/openshift-storage-
fi
