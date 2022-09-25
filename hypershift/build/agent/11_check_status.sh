. export.sh

if [[ ! -f ./tmp/kubeconfig ]] 
then
	./GET_KUBECONFIG.sh
fi

echo "Agents:"
oc get agents -n ${HOSTED_CONTROL_PLANE_NAMESPACE}
echo ""

echo "Machines:"
oc get machines.cluster.x-k8s.io  -n ${HOSTED_CONTROL_PLANE_NAMESPACE}
echo ""

echo "Nodepools:"
oc get nodepools -n ${CLUSTERS_NAMESPACE}
echo ""

echo "Nodes (on nested cluster):"
KUBECONFIG=./tmp/kubeconfig oc get nodes
echo ""
