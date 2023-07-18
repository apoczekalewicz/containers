#!/bin/bash
if [[ "$#" -ne 1 ]]
then
	echo "Usage: $0 <secret.yaml>"
	exit 1
fi

cat $1 | kubeseal --scope cluster-wide --controller-namespace sealed-secrets --controller-name sealed-secrets --format yaml > sealed-$1
