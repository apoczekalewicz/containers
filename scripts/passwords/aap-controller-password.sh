echo AAP:
oc -n ansible-automation-platform get secret controller-admin-password -o go-template='{{index .data "password" | base64decode}}'
echo ""
echo AutomationHub:
oc -n ansible-automation-platform get secret automationhub-admin-password -o go-template='{{index .data "password" | base64decode}}'
echo ""

