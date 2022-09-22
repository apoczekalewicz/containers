export CLUSTERS_NAMESPACE="clusters"
export HOSTED="nestedbm"
export HOSTED_CLUSTER_NS="clusters-${HOSTED}"
export PULL_SECRET_NAME="${HOSTED}-pull-secret"
export MACHINE_CIDR="172.27.0.0/16"
export OCP_RELEASE_VERSION="4.11.5"
export OCP_ARCH="x86_64"
export BASEDOMAIN="redhat.lab"

export PULL_SECRET_CONTENT=$(cat /home/ap/pull-secret)
export SSH_PUB=$(cat ~/.ssh/id_rsa.pub)
