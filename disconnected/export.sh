export LOCAL_REGISTRY=work.ap.vlab:8443
export LOCAL_REPOSITORY="ocp4/openshift4"
export PRODUCT_REPO='openshift-release-dev'
export OCP_RELEASE="4.9.23"
export LOCAL_SECRET_JSON=./pull-secret.txt
export RELEASE_NAME="ocp-release"
export ARCHITECTURE="x86_64"
export REMOVABLE_MEDIA_PATH="./tmpdir"

# For Creating an image signature config map manually
#export OCP_RELEASE_NUMBER=${OCP_RELEASE}
#export DIGEST="$(oc adm release info quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE_NUMBER}-${ARCHITECTURE} | sed -n 's/Pull From: .*@//p')"
#export DIGEST_ALGO="${DIGEST%%:*}"
#export DIGEST_ENCODED="${DIGEST#*:}"
#export SIGNATURE_BASE64=$(curl -s "https://mirror.openshift.com/pub/openshift-v4/signatures/openshift/release/${DIGEST_ALGO}=${DIGEST_ENCODED}/signature-1" | base64 -w0 && echo)

#cat >checksum-${OCP_RELEASE_NUMBER}.yaml <<EOF
#apiVersion: v1
#kind: ConfigMap
#metadata:
#  name: release-image-${OCP_RELEASE_NUMBER}
#  namespace: openshift-config-managed
#  labels:
#    release.openshift.io/verification-signatures: ""
#binaryData:
#  ${DIGEST_ALGO}-${DIGEST_ENCODED}: ${SIGNATURE_BASE64}
#EOF
