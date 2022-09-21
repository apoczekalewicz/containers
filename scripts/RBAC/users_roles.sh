oc get rolebindings,clusterrolebindings --all-namespaces  -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,USERS:subjects[?(@.kind=="User")].name'

