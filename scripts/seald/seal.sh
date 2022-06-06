#!/bin/bash
if [[ "$#" -ne 1 ]]
then
	echo "Usage: $0 <secret.yaml>"
	exit 1
fi

cat $1 | kubeseal --controller-namespace sealed-secrets --controller-name sealed-secrets-controller --format yaml > sealed-$1
