cat > noobaa-credentials <<EOF
[default]
aws_access_key_id="KzfRX3OcSzyd7ln3eXx5"
aws_secret_access_key="3arCAlT0EY/wdK54WgC+/WasxVd5T1aYzfb44ixd"
EOF

oc create secret generic cloud-credentials --namespace openshift-adp --from-file cloud=noobaa-credentials --dry-run=client -o yaml --save-config | oc apply -f - 

rm -f noobaa-credentials
