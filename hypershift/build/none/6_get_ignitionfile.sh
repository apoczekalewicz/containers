. export.sh
mkdir -p ./tmp
IGNITION_ENDPOINT=$(oc get hc ${HOSTED} -n ${CLUSTERS_NAMESPACE} -o json | jq -r '.status.ignitionEndpoint')
IGNITION_TOKEN_SECRET=$(oc -n clusters-${HOSTED} get secret | grep token-${HOSTED}  | awk '{print $1}')
set +x
IGNITION_TOKEN=$(oc -n clusters-${HOSTED} get secret ${IGNITION_TOKEN_SECRET} -o jsonpath={.data.token})
curl -s -k -H "Authorization: Bearer ${IGNITION_TOKEN}" https://${IGNITION_ENDPOINT}/ignition > ./tmp/worker.ign

