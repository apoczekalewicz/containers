echo Route:
oc get -n openshift-gitops route
echo Admin password:
oc get -n openshift-gitops secret openshift-gitops-cluster -o json | jq -r '.data | .[]' | base64 -d ; echo ""
