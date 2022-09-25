. export.sh
oc create ns ${HOSTED_CONTROL_PLANE_NAMESPACE}
hypershift create cluster agent --name=${HOSTED_CLUSTER_NAME} --pull-secret=${PULL_SECRET_FILE} --agent-namespace=${HOSTED_CONTROL_PLANE_NAMESPACE} --api-server-address=api.${HOSTED_CLUSTER_NAME}.${BASEDOMAIN} --base-domain ${BASEDOMAIN}
