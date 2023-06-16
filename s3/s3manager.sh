if [[ "$#" -ne 2 ]]
then
	echo "Usage: $0 <ns> <secret>"
	exit 1
fi

NS=$1
SECRET=$2
ENDPOINT=s3.openshift-storage.svc

ACCESS_KEY_ID=$( oc get secret -o yaml -n $NS $SECRET | grep AWS_ACCESS_KEY_ID | awk '{ print $2 }' | base64 -d )
SECRET_ACCESS_KEY=$( oc get secret -o yaml -n $NS $SECRET | grep AWS_SECRET_ACCESS_KEY | awk '{ print $2 }' | base64 -d )

oc new-app cloudlena/s3manager -e ENDPOINT=$ENDPOINT -e ACCESS_KEY_ID=$ACCESS_KEY_ID -e SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY -e SKIP_SSL_VERIFICATION=true
oc expose svc/s3manager


