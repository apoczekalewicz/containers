oc new-project example1
oc new-app https://github.com/apoczekalewicz/app-info.git --context-dir ./src
oc expose svc app-info
oc get route
oc scale --replicas=3 deployment app-info 
# toolbox:
# host app-info
# host app-info-headless
