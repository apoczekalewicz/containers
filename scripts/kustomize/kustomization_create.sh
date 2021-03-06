#!/bin/bash

FILENAME=kustomization.yaml

if [[ "$#" -eq 0 ]]
then
	echo "Usage: $0 <dir|file>..."
	exit 1
fi

for i in $@
do
	test -f $i && FILES="$FILES $i"
	test -d $i && DIRS="$DIRS $i"
done

echo Files - $FILES
echo Dirs - $DIRS

echo "apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: openshift-gitops

commonAnnotations:
  argocd.argoproj.io/sync-options: SkipDryRunOnMissingResource=true
  argocd.argoproj.io/sync-wave: \"2\"
" > $FILENAME

if [[ "$DIRS" ]]
then
	echo "bases:" >> $FILENAME

	for i in $DIRS
	do
		echo "  - $i" >> $FILENAME
	done
fi

echo "" >> $FILENAME

if [[ "$FILES" ]]
then
        echo "resources:" >> $FILENAME

        for i in $FILES
        do
                echo "  - $i" >> $FILENAME
        done
fi

