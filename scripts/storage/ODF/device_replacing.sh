#!/bin/bash
if [[ "$#" -ne 1 ]]
then
	echo "Usage: $0 <id_osd>"
	echo "Example: $0 0"
	exit 1
fi
oc project openshift-storage
osd_id_to_remove=$1
oc scale -n openshift-storage deployment rook-ceph-osd-${osd_id_to_remove} --replicas=0
oc delete -n openshift-storage job ocs-osd-removal-job
oc process -n openshift-storage ocs-osd-removal -p FAILED_OSD_IDS=${osd_id_to_remove} |oc create -n openshift-storage -f -
oc wait --for=condition=Complete job ocs-osd-removal-job
oc delete -n openshift-storage job ocs-osd-removal-job
watch -n0 "oc get deployment rook-ceph-osd-${osd_id_to_remove}"
