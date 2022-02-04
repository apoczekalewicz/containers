#!/bin/bash
FILTER=$1
ACTION=$2

if [[ "$#" -lt "1" ]]
then
	echo "Usage: $0 <filter> [delete]"
	echo "Example: $0 velero.io/v1"
	exit 1
fi

for RESOURCE in $(oc api-resources  | grep $FILTER | awk '{ print $1 }')
do
	IFS=$'\n'
	for i in $(oc get $RESOURCE -A --no-headers  2>/dev/null  )
	do
		RESOURCE_NAME=$( echo $i | awk '{ print $2 }')
		RESOURCE_NS=$( echo $i | awk '{ print $1 }')

		if [[ "$ACTION" = "delete" ]]
		then
			oc delete -n $RESOURCE_NS $RESOURCE $RESOURCE_NAME
		else
			echo -e "Resource: $RESOURCE\t\t\t\t\t\t\tName: $RESOURCE_NAME\t\t\t\t\t\tNS: $RESOURCE_NS"
		fi

	done
done

