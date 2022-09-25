. export.sh

if [[ ! -f ./tmp/kubeconfig ]] 
then
	./GET_KUBECONFIG.sh
fi

export KUBECONFIG=./tmp/kubeconfig

cat <<"EOF" | oc apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: metallb
  labels:
    openshift.io/cluster-monitoring: "true"
  annotations:
    workload.openshift.io/allowed: management
EOF

cat <<"EOF" | oc apply -f -
apiVersion: operators.coreos.com/v1
kind: OperatorGroup
metadata:
  name: metallb-operator-operatorgroup
  namespace: metallb
spec:
  targetNamespaces:
  - metallb
EOF

cat <<"EOF" | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: metallb-operator
  namespace: metallb
spec:
  channel: "stable"
  name: metallb-operator
  source: redhat-operators
  sourceNamespace: openshift-marketplace
EOF

cat <<"EOF" | oc apply -f -
apiVersion: metallb.io/v1beta1
kind: MetalLB
metadata:
  name: metallb
  namespace: metallb
EOF
