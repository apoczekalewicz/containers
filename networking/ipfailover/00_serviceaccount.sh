oc create sa ipfailover
oc adm policy add-scc-to-user hostnetwork -z ipfailover
oc adm policy add-scc-to-user privileged -z ipfailover

