. export.sh
mkdir -p ./tmp

export HTTPS_NODEPORT=$(oc --kubeconfig ./tmp/kubeconfig get services -n openshift-ingress router-nodeport-default -o wide | awk '{print $5}' | awk -F "443:" '{print $2}' | awk -F "/" '{print $1}' | tr -d '[:space:]')


cat << EOF > ./tmp/apps-ingress-service.yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: ${KUBEVIRT_CLUSTER_NAME}
  name: apps-ingress
  namespace: ${KUBEVIRT_CLUSTER_NAMESPACE}
spec:
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: https-443
    port: 443
    protocol: TCP
    targetPort: $HTTPS_NODEPORT
  selector:
    kubevirt.io: virt-launcher
  sessionAffinity: None
  type: ClusterIP
EOF

cat << EOF > ./tmp/apps-ingress-subdomain-route-443.yaml
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: ${KUBEVIRT_CLUSTER_NAME}-443
  namespace: ${KUBEVIRT_CLUSTER_NAMESPACE}
spec:
  host: wildcard.apps.$KUBEVIRT_CLUSTER_BASE_DOMAIN
  wildcardPolicy: Subdomain
  tls:
    termination: passthrough
  port:
    targetPort: https-443
  to:
    kind: Service
    name: apps-ingress
    weight: 100
EOF

oc create -f ./tmp/apps-ingress-service.yaml
oc create -f ./tmp/apps-ingress-subdomain-route-443.yaml
