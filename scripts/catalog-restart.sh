oc -n openshift-operator-lifecycle-manager delete $(oc get pods  -l app=catalog-operator -o NAME -n openshift-operator-lifecycle-manager)
