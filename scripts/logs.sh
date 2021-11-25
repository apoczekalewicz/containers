#!/bin/bash

# events
oc get events --sort-by=".lastTimestamp" > events.txt

# logs
for pod in $(oc get pods --no-headers | awk '{ print $1 }')
do
	for container in $(oc get pod $pod -o jsonpath='{.spec.containers[*].name}')
	do
		oc logs $pod -c $container -f > ${container}.log &
	done

done

read FINISH 
exit
