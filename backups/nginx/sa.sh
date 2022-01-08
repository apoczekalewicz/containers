if [[ "$1" = "remove" ]]
then
	oc adm policy remove-scc-from-user privileged -z nginx
	oc delete sa nginx
else
	oc create sa nginx
	oc adm policy add-scc-to-user privileged -z nginx
fi
