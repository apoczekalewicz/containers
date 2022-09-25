. export.sh
echo "Console url:"
KUBECONFIG=./tmp/kubeconfig oc whoami --show-console
echo "kubeadmin password:"
oc get secrets ${HOSTED_CLUSTER_NAME}-kubeadmin-password -n clusters -o yaml | grep "password:" | awk '{ print $2 }' | base64 -d
echo ""

