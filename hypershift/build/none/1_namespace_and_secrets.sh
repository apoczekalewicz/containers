. export.sh

envsubst <<"EOF" | oc apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: ${CLUSTERS_NAMESPACE}
EOF

export PS64=$(echo -n ${PULL_SECRET_CONTENT} | base64 -w0)
envsubst <<"EOF" | oc apply -f -
apiVersion: v1
data:
  .dockerconfigjson: ${PS64}
kind: Secret
metadata:
  name: ${PULL_SECRET_NAME}
  namespace: ${CLUSTERS_NAMESPACE}
type: kubernetes.io/dockerconfigjson
EOF

envsubst <<"EOF" | oc apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: ${HOSTED}-ssh-key
  namespace: ${CLUSTERS_NAMESPACE}
stringData:
  id_rsa.pub: ${SSH_PUB}
EOF
