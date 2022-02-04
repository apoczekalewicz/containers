#!/bin/bash

IMAGE=$( oc get clusterversions.config.openshift.io  version -o go-template='{{.spec.desiredUpdate.image}}' )
echo $IMAGE
IFS=$'\n'
COUNTER=0
for i in $(oc get nodes -o wide | awk '{ print $1 " " $6 }' | grep -v INTERNAL)
do
	let COUNTER++
	NAME=$( echo $i | cut -f1 -d " ")
	IP=$( echo $i | cut -f2 -d " ")
	echo "$COUNTER - *** ${NAME} - ${IP} ***"
	TAB[$COUNTER]=$IP
done

echo -n "Host - "
read NUM
ssh core@${TAB[$NUM]} sudo /run/bin/machine-config-daemon pivot $IMAGE
