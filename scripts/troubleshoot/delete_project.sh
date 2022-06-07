#!/bin/bash
# skrypt brzydko napisany do poprawy

[[ "$#" -ne "1" ]] && echo "Usage: $0 <project name>" && exit1
PROJECT=$1

oc get namespace $PROJECT -o json> /tmp/file
oc proxy &>/dev/null &
vim /tmp/file
curl -k -H "Content-Type: application/json" -X PUT --data-binary @/tmp/file http://127.0.0.1:8001/api/v1/namespaces/${PROJECT}/finalize
kill $( pidof oc proxy )

