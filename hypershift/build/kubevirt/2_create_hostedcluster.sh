. export.sh

hypershift create cluster kubevirt \
--name $CLUSTER_NAME \
--base-domain $BASE_DOMAIN \
--node-pool-replicas=3 \
--pull-secret $PULL_SECRET \
--service-publishing-strategy=NodePort
