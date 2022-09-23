. export.sh
oc get hostedclusters -n clusters
echo ""
oc get pod -n ${KUBEVIRT_CLUSTER_NAMESPACE}
