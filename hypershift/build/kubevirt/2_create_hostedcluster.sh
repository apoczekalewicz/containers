. export.sh

hypershift create cluster kubevirt \
--name ${KUBEVIRT_CLUSTER_NAME} \
--base-domain ${KUBEVIRT_CLUSTER_BASE_DOMAIN} \
--node-pool-replicas=3 \
--pull-secret ${PULL_SECRET} \
--service-publishing-strategy=NodePort
