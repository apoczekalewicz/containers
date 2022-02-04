#!/bin/bash
IFS=$'\n'
for line in $( oc get pod -A | grep -v Running)
do
	NS=$( echo $line | awk '{ print $1 }' )
	POD=$( echo $line | awk '{ print $2 }' )
	oc delete pod -n $NS $POD &
done
