for i in $( oc get nodes | grep worker | awk '{ print $1 }' )
do
	oc adm cordon $i
done

for i in $( oc get nodes | grep worker | awk '{ print $1 }' )
do
        oc adm drain $i --ignore-daemonsets --force --grace-period=30 --delete-emptydir-data
done


