export CLUSTERS_NAMESPACE="clusters"
export HOSTED_CLUSTER_NAME="nestedbm"
export HOSTED_CONTROL_PLANE_NAMESPACE="${CLUSTERS_NAMESPACE}-${HOSTED_CLUSTER_NAME}"
export BASEDOMAIN="redhat.lab"
export PULL_SECRET_FILE=${HOME}/pull-secret
export SSH_PUB_KEY=$(cat $HOME/.ssh/id_rsa.pub)
export INGRESS_IP=172.27.5.244
