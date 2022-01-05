cat > noobaa-credentials <<EOF
[default]
aws_access_key_id="2LRxPKcxag5xVTDgLe2g"
aws_secret_access_key="+D5P/Lwzq+IblBfWhAwhXBlMP7pLPInXkUL0Kmwy"
EOF

oc create secret generic cloud-credentials --namespace openshift-adp --from-file cloud=noobaa-credentials --dry-run=client -o yaml --save-config | oc apply -f - 

rm -f noobaa-credentials
