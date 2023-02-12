#!/bin/bash 
#
IFS=$'\n'
COUNTER=0
for i in $(oc get subs -A  | awk '{ print $2 }' | sort -u | grep -v NAME)
do
        let COUNTER++
        SUB=$( echo $i )
        echo "$COUNTER - *** ${SUB} ***"
        TAB[$COUNTER]=$SUB
done

echo -n "Sub - "
read NUM

SUB=${TAB[$NUM]}
NAMESPACE=$( oc get subs -A | grep $SUB | awk '{print $1 }' )

CURRENT_CSV=$( oc get subs -n ${NAMESPACE} ${SUB} -o yaml |grep currentCSV | awk '{ print $2 }' )
INSTALL_PLAN=$( oc get installplan -n ${NAMESPACE} | grep $CURRENT_CSV | grep true | awk '{ print $1 }' )

echo ""
echo Resources:
oc get installplan -n ${NAMESPACE} ${INSTALL_PLAN} -o json | jq '.status.plan[].resource | {kind, name} | join("/")' | sort

echo ""
echo Deployments:
oc get csv -n ${NAMESPACE} ${CURRENT_CSV}  -o json | jq '.spec.install.spec.deployments[] | {name}'|grep name | awk '{ print $2 }' 

echo ""
CRDS=$( oc get installplan -n ${NAMESPACE} ${INSTALL_PLAN} -o json | jq '.status.plan[].resource | {kind, name} | join("/")' | grep CustomResource | cut -f2 -d/ | cut -f1 -d\" )
for i in $CRDS 
do
	echo CR: $i
	oc get $i -A 
	echo ""
done
