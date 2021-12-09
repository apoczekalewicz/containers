podman build -t quay.io/apoczeka/hook-runner:latest -f ./Dockerfile
podman login quay.io
podman push quay.io/apoczeka/hook-runner:latest
#podman logout quay.io

