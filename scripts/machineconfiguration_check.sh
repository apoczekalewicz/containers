#!/bin/bash
for i in $( oc get node --no-headers | awk '{ print $1 }' ) ; do echo -e "\033[0;31m $i \033[0m"; oc describe node $i | grep machineconfiguration ; done 

for i in $( oc get pod | grep config-da | awk '{ print $1 }' ) ; do NODE=$( oc get pod $i -o wide --no-headers | awk '{ print $7 " - " $6 }' ); echo -e "\033[0;31m $NODE \033[0m"; oc logs $i -c machine-config-daemon | grep expected  | tail -1 ; done

