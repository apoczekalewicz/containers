oc new-project net-audit
oc create sa net-audit-sa
# oc apply -f 01_ClusterRole_net-audit.yml
# oc adm policy add-cluster-role-to-user net-audit-role -z net-audit-sa -n net-audit
# export TOKEN=$( oc extract secret/`oc get sa/net-audit-sa -n net-audit -o jsonpath='{.secrets[0].name}{"\n"}'` --keys=token --to=- 2>/dev/null )
# export ENDPOINT=$(oc config current-context | cut -d/ -f2 | tr - .)
