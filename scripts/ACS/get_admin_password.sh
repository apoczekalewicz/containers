oc -n rhacs-operator get secret central-htpasswd -o go-template='{{index .data "password" | base64decode}}'

