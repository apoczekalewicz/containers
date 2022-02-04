#!/bin/bash

USER=core
IFS=$'\n'
for i in $(oc get nodes -o wide | grep master | awk '{ print $1 " " $6 }' | grep -v INTERNAL)
do
	NAME=$( echo $i | cut -f1 -d " ")
	IP=$( echo $i | cut -f2 -d " ")
	echo "*** ${NAME} - ${IP} ***"
	ssh ${USER}@${IP} "$@"
	echo ""
done

