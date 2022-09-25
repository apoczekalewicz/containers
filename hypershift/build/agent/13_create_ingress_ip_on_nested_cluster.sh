. export.sh

if [[ ! -f ./tmp/kubeconfig ]] 
then
	./GET_KUBECONFIG.sh
fi

export KUBECONFIG=./tmp/kubeconfig

envsubst <<"EOF" | oc apply -f -
apiVersion: metallb.io/v1alpha1
kind: AddressPool
metadata:
  name: ingress-public-ip
  namespace: metallb
spec:
  protocol: layer2
  autoAssign: false
  addresses:
    - ${INGRESS_IP}-${INGRESS_IP}
EOF
