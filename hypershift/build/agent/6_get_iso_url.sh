. export.sh

oc get InfraEnv ${HOSTED_CLUSTER_NAME} -ojsonpath="{.status.isoDownloadURL}"
echo ""
