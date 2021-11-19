cat > noobaa-credentials <<EOF
[default]
aws_access_key_id=$NOOBAA_S3_ACCESS_KEY_ID
aws_secret_access_key=$NOOBAA_S3_SECRET_ACCESS_KEY
EOF

oc create secret generic cloud-credentials --namespace openshift-adp --from-file cloud=noobaa-credentials --dry-run -o yaml --save-config
