#!/bin/bash
if [[ "$#" -ne 2 ]]
then
	echo "Usage $0 <node> <mc>"
	exit 1

fi
node_name=$1
new_value=$2
echo oc patch node $node_name --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/currentConfig\": \"$new_value\"}}}'" | bash
echo oc patch node $node_name --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/desiredConfig\": \"$new_value\"}}}'" | bash
echo oc patch node $node_name --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/reason\": \"\"}}}'" | bash
echo oc patch node $node_name --type merge --patch "'{\"metadata\": {\"annotations\": {\"machineconfiguration.openshift.io/state\": \"Done\"}}}'" | bash
