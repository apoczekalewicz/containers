#!/bin/bash

oc project openshift-machine-config-operator
for i in $( oc get node --no-headers | awk '{ print $1 }' ) ; do echo -e "\033[0;31m $i \033[0m"; oc describe node $i | grep machineconfiguration ; done 

for i in $( oc get pod | grep config-da | awk '{ print $1 }' ) ; do NODE=$( oc get pod $i -o wide --no-headers | awk '{ print $7 " - " $6 }' ); echo -e "\033[0;31m $NODE \033[0m"; oc logs $i -c machine-config-daemon | grep expected  | tail -1 ; done

# /run/bin/machine-config-daemon pivot quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:f5628b30aa047fe32cba9308c70c581f7d9812f40a3e651a84f0532af184bfd2

