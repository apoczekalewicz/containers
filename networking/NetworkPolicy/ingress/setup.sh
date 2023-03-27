oc new-project demo-net1
oc new-project demo-net2
oc project demo-net1
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/deployment.yml
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/svc.yaml
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/cm-index.yaml
oc project demo-net2
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/deployment.yml
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/svc.yaml
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/cm-index.yaml
# oc label namespace net=trusted
# oc -n demo-net1 exec -it httpd-demo-86cbbb9d55-k9tsc --  curl http://httpd-demo.demo-net2

