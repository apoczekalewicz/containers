. export.sh
oc get agents -n ${HOSTED_CONTROL_PLANE_NAMESPACE}

echo ""
echo "More info:"
for i in $( oc get agents -n ${HOSTED_CONTROL_PLANE_NAMESPACE} | grep -v NAME | awk '{ print $1 }' )
do
	echo agent $i
	oc get agents -n ${HOSTED_CONTROL_PLANE_NAMESPACE} $i -o yaml| grep ipV4 -A1 | tail -1
done
