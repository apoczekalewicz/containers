oc new-project example1
oc new-app https://github.com/apoczekalewicz/app-info.git --context-dir ./src
oc expose svc app-info
oc get route

