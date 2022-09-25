. export.sh
oc scale NodePool -n ${CLUSTERS_NAMESPACE} ${HOSTED_CLUSTER_NAME} --replicas=3
