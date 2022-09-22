. export.sh
hypershift create kubeconfig > test-kubeconfig

export HTTPS_NODEPORT=$(oc --kubeconfig test-kubeconfig get services -n openshift-ingress router-nodeport-default -o wide | awk '{print $5}' | awk -F "443:" '{print $2}' | awk -F "/" '{print $1}' | tr -d '[:space:]')


cat << EOF > apps-ingress-service.yaml
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

cat << EOF > apps-ingress-subdomain-route-443.yaml
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

oc create -f apps-ingress-service.yaml
oc create -f apps-ingress-subdomain-route-443.yaml
