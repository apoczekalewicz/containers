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
echo -e "\noc adm drain ${TAB[$NUM]} --ignore-daemonsets=true --delete-local-data=true --force\n"
oc adm drain ${TAB[$NUM]} --ignore-daemonsets=true --delete-local-data=true --force

