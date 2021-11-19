cat > noobaa-credentials <<EOF
[default]
aws_access_key_id=HqJiTngJEsL6oNSB8MAC
aws_secret_access_key=qpsr0XYrWTvdATHOOA/6QDlWC8MFcGx9BZDKWYbX
EOF

oc create secret generic cloud-credentials --namespace openshift-adp --from-file cloud=noobaa-credentials --dry-run -o yaml --save-config
