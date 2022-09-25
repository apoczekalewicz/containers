. export.sh

if [[ ! -f ./tmp/kubeconfig ]] 
then
	./GET_KUBECONFIG.sh
fi

export KUBECONFIG=./tmp/kubeconfig

cat <<"EOF" | oc apply -f -
kind: Service
apiVersion: v1
metadata:
  annotations:
    metallb.universe.tf/address-pool: ingress-public-ip
  name: metallb-ingress
  namespace: openshift-ingress
spec:
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 80
    - name: https
      protocol: TCP
      port: 443
      targetPort: 443
  selector:
    ingresscontroller.operator.openshift.io/deployment-ingresscontroller: default
  type: LoadBalancer
EOF
