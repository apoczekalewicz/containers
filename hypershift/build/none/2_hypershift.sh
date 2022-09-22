# dodalem infrastructureAvailabilityPolicy: SingleReplica - aby uzyskac efekt posiadania 1 funkcjonalnego workera
. export.sh

envsubst <<"EOF" | oc apply -f -
apiVersion: hypershift.openshift.io/v1alpha1
kind: HostedCluster
metadata:
  name: ${HOSTED}
  namespace: ${CLUSTERS_NAMESPACE}
spec:
  infrastructureAvailabilityPolicy: SingleReplica
  release:
    image: "quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE_VERSION}-${OCP_ARCH}"
  pullSecret:
    name: ${PULL_SECRET_NAME}
  sshKey:
    name: "${HOSTED}-ssh-key"
  networking:
    serviceCIDR: "172.31.0.0/16"
    podCIDR: "10.132.0.0/14"
    machineCIDR: "${MACHINE_CIDR}"
  platform:
    type: None
  infraID: ${HOSTED}
  dns:
    baseDomain: ${BASEDOMAIN}
  services:
  - service: APIServer
    servicePublishingStrategy:
      nodePort:
        address: api.${HOSTED}.${BASEDOMAIN}
      type: NodePort
  - service: OAuthServer
    servicePublishingStrategy:
      nodePort:
        address: api.${HOSTED}.${BASEDOMAIN}
      type: NodePort
  - service: OIDC
    servicePublishingStrategy:
      nodePort:
        address: api.${HOSTED}.${BASEDOMAIN}
      type: None
  - service: Konnectivity
    servicePublishingStrategy:
      nodePort:
        address: api.${HOSTED}.${BASEDOMAIN}
      type: NodePort
  - service: Ignition
    servicePublishingStrategy:
      nodePort:
        address: api.${HOSTED}.${BASEDOMAIN}
      type: NodePort
EOF

envsubst <<"EOF" | oc apply -f -
apiVersion: hypershift.openshift.io/v1alpha1
kind: NodePool
metadata:
  name: ${HOSTED}-workers
  namespace: ${CLUSTERS_NAMESPACE}
spec:
  clusterName: ${HOSTED}
  replicas: 0
  management:
    autoRepair: false
    upgradeType: Replace
  platform:
    type: None
  release:
    image: "quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE_VERSION}-${OCP_ARCH}"
EOF
