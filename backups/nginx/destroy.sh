#!/bin/bash
oc delete -f ./nginx.yaml
./sa.sh remove
