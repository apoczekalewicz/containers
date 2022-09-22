. export.sh
mkdir -p ./tmp
oc extract -n ${CLUSTERS_NAMESPACE} secret/${HOSTED}-admin-kubeconfig --to=- > ./tmp/${HOSTED}-kubeconfig

