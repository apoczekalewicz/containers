# self-sign
mkdir /tmp/tls ; cd /tmp/tls
openssl req -new -newkey rsa:4096 -days 25 -nodes -x509 -subj "/C=US/ST=NC/L=Raleigh/O=Example/CN=www.example.com" -keyout tls/tls.key -out tls/tls.crt

# project
oc create ns acm-grc-ansible-example

# secret 
oc -n acm-grc-ansible-example create secret generic certs 
--from-file=tls.key=/tmp/tls/tls.key 
--from-file=tls.crt=/tmp/tls/tls.crt

# app
oc -n acm-grc-ansible-example apply -f app.yml

export ROUTE=$(oc -n acm-grc-ansible-example get route | tail -1 | tr -s ' ' | cut -f 2 -d ' ')
echo | openssl s_client -showcerts -connect "$ROUTE:443" 2>/dev/null | openssl x509 -inform pem -noout -text
