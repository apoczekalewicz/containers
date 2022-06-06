oc -n ansible-automation-platform get secret controller-admin-password -o go-template='{{index .data "password" | base64decode}}'
