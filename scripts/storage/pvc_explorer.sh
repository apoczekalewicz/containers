#!/bin/bash

[[ "$#" -ne "1" ]] && echo "Usage: $0 pvcname" && exit 1

PVC=${1}

MODE=$( oc get pvc $PVC -o yaml | grep volumeMode | awk '{ print $2 }' )

if [[ "$MODE" == "Filesystem" ]]
then

	echo "Your PVC: ${PVC} should be on /pvc"
	oc run -it --rm pvcexplorer --image=dummy --restart=Never --overrides='{"spec":{"containers":[{"restartPolicy":"Never", "tty":true, "stdin": true, "command":["/bin/sh", "-c", "bash"],"image":"quay.io/apoczeka/container-toolbox","name":"tmp-pod","volumeMounts":[{"mountPath":"/pvc","name":"volume"}]}],"volumes":[{"name":"volume","persistentVolumeClaim":{"claimName":"'${PVC}'"}}]}}' 2>/dev/null

else

	echo "Your PVC: ${PVC} should be on /dev/pvc"
	oc run -it --rm pvcexplorer --image=dummy --restart=Never --overrides='{"spec":{"containers":[{"restartPolicy":"Never", "tty":true, "stdin": true, "command":["/bin/sh", "-c", "bash"],"image":"quay.io/apoczeka/container-toolbox","name":"tmp-pod","volumeDevices":[{"devicePath":"/dev/pvc","name":"volume"}]}],"volumes":[{"name":"volume","persistentVolumeClaim":{"claimName":"'${PVC}'"}}]}}' 2>/dev/null

fi
