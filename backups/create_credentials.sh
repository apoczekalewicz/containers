cat > noobaa-credentials <<EOF
[default]
aws_access_key_id="Z034N9gF2miGGZUb5M1H"
aws_secret_access_key="AGu9hKEQQ8Ez3etIzkDAoUkQUXv89nRrBgqlrTAl"
EOF

oc create secret generic cloud-credentials --namespace openshift-adp --from-file cloud=noobaa-credentials --dry-run=client -o yaml --save-config | oc apply -f - 

rm -f noobaa-credentials
