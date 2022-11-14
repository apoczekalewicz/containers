oc -n kube-system get secret kubeadmin -o go-template='{{index .data "kubeadmin" | base64decode}}'
