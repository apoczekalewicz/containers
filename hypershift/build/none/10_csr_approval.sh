. export.sh
export KUBECONFIG=./tmp/${HOSTED}-kubeconfig
oc get csr -o go-template='{{range .items}}{{if not .status}}{{.metadata.name}}{{"\n"}}{{end}}{{end}}' | xargs oc adm certificate approve 

