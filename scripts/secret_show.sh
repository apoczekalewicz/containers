IFS="\n"
for i in $(oc get -o json secret/$1 | jq '.data' | grep ":" )
do
	echo $i
	KEY=$( echo $i | cut -f1 -d\:)
	VALUE=$( echo $i | cut -f2 -d\: | cut -f2 -d\" | base64 -d )

	#echo "Key: $KEY"
	#echo "Value: $VALUE"
done
