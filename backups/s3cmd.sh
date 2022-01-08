s3cmd ls -r s3://backup-bucket/velero/
s3cmd  get --recursive  s3://backup-bucket/velero /tmp/backup
#s3cmd   del -r  s3://backup-bucket/velero/

