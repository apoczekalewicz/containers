. export.sh
KARG_APPEND="coreos.inst.ignition_url=http://172.27.9.5/worker.ign coreos.inst.install_dev=/dev/sda"

podman run --rm -it -v ./tmp/:/data:z --workdir /data quay.io/coreos/coreos-installer:release iso customize --live-karg-append="${KARG_APPEND}" -o ./rhcos.iso ./rhcos-live.x86_64.iso
podman run --rm -it -v ./tmp/:/data:z --workdir /data quay.io/coreos/coreos-installer:release iso kargs show ./rhcos.iso
chmod a+r ./tmp/rhcos.iso
echo "You should publish rhcos.iso and worker.ign on the webserver"
