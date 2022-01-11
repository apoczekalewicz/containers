#!/bin/bash
for i in $( oc get node --no-headers | awk '{ print $1 }' ) ; do echo -e "\033[0;31m $i \033[0m"; oc describe node $i | grep machineconfiguration ; done 

