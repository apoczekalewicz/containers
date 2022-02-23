#!/bin/bash

export ROX_CENTRAL_ADDRESS="https://central-stackrox.apps.ocp1.example.lab:443"

roxctl --insecure-skip-tls-verify --token-file acs-admin-token.txt -e "$ROX_CENTRAL_ADDRESS" central init-bundles generate init-bundle --output-secrets init_bundle.yaml
oc create -f ./init_bundle.yaml

