#!/bin/bash
echo -e "POD - PVC - PV\n"
for i in $( oc get pod -o json --all-namespaces | jq -j '.items[] | "\(.metadata.namespace),\(.metadata.name),\(.spec.volumes[].persistentVolumeClaim.claimName)\n"' | grep -v null )
do
        NS=$( echo $i | cut -f1 -d, )
        POD=$( echo $i | cut -f2 -d, )
        PVC=$( echo $i | cut -f3 -d, )
        PV=$(oc get pvc -n $NS $PVC -o json | jq -r '.spec.volumeName')

        echo "POD: $NS/$POD   -   PVC: $PVC   -   PV: $PV"
done

