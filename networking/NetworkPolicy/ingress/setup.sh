oc new-project demo-net1
oc new-project demo-net2
oc project demo-net1
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/deployment.yml
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/svc.yaml
oc project demo-net2
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/deployment.yml
oc apply -f https://raw.githubusercontent.com/apoczekalewicz/containers/master/httpd-deployments/httpd-deployment/svc.yaml

# oc label project/demo-net2 project=demo-net2
