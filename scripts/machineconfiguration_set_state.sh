#!/bin/bash
if [[ "$#" -ne 1 ]]
then
	echo "Usage $0 <mc>"
	exit 1

fi
MC=$1

IFS=$'\n'
COUNTER=0
for i in $(oc get nodes -o wide | awk '{ print $1 " " $6 }' | grep -v INTERNAL)
do
        let COUNTER++
        NAME=$( echo $i | cut -f1 -d " ")
        IP=$( echo $i | cut -f2 -d " ")
        echo "$COUNTER - *** ${NAME} - ${IP} ***"
        TAB[$COUNTER]=$NAME
done

echo -n "Host - "
read NUM
NODE_NAME=${TAB[$NUM]}

echo oc patch node $NODE_NAME --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/currentConfig\": \"$MC\"}}}'" | bash
echo oc patch node $NODE_NAME --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/desiredConfig\": \"$MC\"}}}'" | bash
echo oc patch node $NODE_NAME --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/reason\": \"\"}}}'" | bash
echo oc patch node $NODE_NAME --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/state\": \"Done\"}}}'" | bash

