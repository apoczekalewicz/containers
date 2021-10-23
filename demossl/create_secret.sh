mkdir -p /tmp/tls
openssl req -new -newkey rsa:4096 -days 25 -nodes -x509 -subj "/C=US/ST=NC/L=Raleigh/O=Example/CN=www.example.com" -keyout /tmp/tls/tls.key -out /tmp/tls/tls.crt

oc create secret generic certs --from-file=tls.key=/tmp/tls/tls.key --from-file=tls.crt=/tmp/tls/tls.crt -o yaml --dry-run=client  > manifests/secret.yml

#openssl s_client -connect demossl-ansibletest.apps.ocp1.example.lab:443  | openssl x509 -text|less
