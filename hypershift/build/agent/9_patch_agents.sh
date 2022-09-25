. export.sh
echo "Patch manualy your agents"
cat $0 | grep merge
# oc patch agent 86f7ac75-4fc4-4b36-8130-40fa12602218 -p '{"spec":{"installation_disk_id":"/dev/sda","approved":true,"hostname":"worker1.nestedbm.redhat.lab"}}' --type merge
