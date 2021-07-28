oc create secret docker-registry quayio --docker-server=quay.io --docker-username=quaydemolab --docker-password="Start123!@#"

oc new-build --name=kinit-sidecar --strategy=docker \
 --to=quay.io/quaydemolab/kinit-sidecar --to-docker=true \
 --build-secret=quayio https://github.com/apoczekalewicz/containers --context-dir kerberos
