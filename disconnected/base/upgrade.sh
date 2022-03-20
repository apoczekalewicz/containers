# oc adm upgrade --allow-explicit-upgrade --allow-upgrade-with-warnings --to-image work.ap.vlab:8443/ocp4/openshift4/ocp-release@sha256:1c13f0926c37c122eb5c86afd754c007f38977c8fc32d7da090490f556945afd

. ./export.sh
HASH=$(oc -n openshift-config-managed get -o yaml cm release-image-${OCP_RELEASE} | grep binaryData | grep api | jq -r '.binaryData' | grep sha | cut -f2 -d\" | tr '-' ':')

echo oc adm upgrade --allow-explicit-upgrade --allow-upgrade-with-warnings --to-image ${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}/${RELEASE_NAME}@${HASH}


