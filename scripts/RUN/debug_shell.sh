#!/bin/bash

IFS=$'\n'
COUNTER=0
for i in $(oc get nodes -o wide | awk '{ print $1 " " $6 }' | grep -v INTERNAL)
do
	let COUNTER++
	NAME=$( echo $i | cut -f1 -d " ")
	IP=$( echo $i | cut -f2 -d " ")
	echo "$COUNTER - *** ${NAME} - ${IP} ***"
	TAB[$COUNTER]=$NAME
done

echo -n "Host - "
read NUM
echo -e "\noc debug node/${TAB[$NUM]}\n"
oc debug node/${TAB[$NUM]}
