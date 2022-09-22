. export.sh
oc get secrets ${HOSTED}-kubeadmin-password -n clusters -o yaml | grep "password:" | awk '{ print $2 }' | base64 -d
echo ""
KUBECONFIG=./tmp/${HOSTED}-kubeconfig oc whoami --show-console

