#!/bin/bash

if [[ "$#" -ne 1 ]]
then
	echo "Usage: $0 <obc>"
	exit
fi

OBC=$1
SECRET=$OBC

OBJECT_BUCKET_NAME=$( oc get obc $OBC -o jsonpath='{.spec.objectBucketName}' )
BUCKET_NAME=$( oc get obc $OBC -o jsonpath='{.spec.bucketName}' )

ENDPOINT_HOST=$( oc get ob ${OBJECT_BUCKET_NAME} -o jsonpath='{.spec.endpoint.bucketHost}' )
ENDPOINT_PORT=$( oc get ob ${OBJECT_BUCKET_NAME} -o jsonpath='{.spec.endpoint.bucketPort}' )
AWS_ACCESS_KEY_ID=$( oc get secret $SECRET -o jsonpath='{.data.AWS_ACCESS_KEY_ID}' | base64 -d )
AWS_SECRET_ACCESS_KEY=$( oc get secret $SECRET -o jsonpath='{.data.AWS_SECRET_ACCESS_KEY}' | base64 -d )
AWS_DEFAULT_REGION=us-west-2

IMAGE="quay.io/redhattraining/aws-cli:2.2.5" # aws client
#IMAGE="quay.io/apoczeka/container-toolbox:latest" # s4cmd

echo "Info:"
echo OBJECT_BUCKET_CLAIM: $OBC
echo OBJECT_BUCKET_NAME: ${OBJECT_BUCKET_NAME}
echo BUCKET_NAME: ${BUCKET_NAME}
echo ENDPOINT_HOST: ${ENDPOINT_HOST}
echo ENDPOINT_PORT: ${ENDPOINT_PORT}
echo AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}
echo AWS_SECRET_ACCESS_KEY: ${AWS_SECRET_ACCESS_KEY}

echo ""
echo "Example command to run:"
echo aws s3 ls s3://${BUCKET_NAME} --endpoint-url=https://${ENDPOINT_HOST} --recursive --summarize --human-readable
echo ""

oc run --rm -it \
     --env AWS_CA_BUNDLE=/run/secrets/kubernetes.io/serviceaccount/service-ca.crt \
     --env AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
     --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
     --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
     obcexplorer --image ${IMAGE} --command -- /bin/bash


