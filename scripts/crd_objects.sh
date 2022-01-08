#!/bin/bash
FILTER=$1
ACTION=$2

if [[ "$#" -lt "1" ]]
then
	echo "Usage: $0 <filter> [delete]"
	echo "Example: $0 velero.io"
	exit 1
fi

for CRD in $(oc get crd  | grep $FILTER | awk '{ print $1 }')
do
		if [[ "$ACTION" = "delete" ]]
		then
			oc delete crd $CRD
		else
			echo -e "CRD: $CRD"
		fi

done

