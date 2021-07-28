FROM ubi8

RUN 	yum install -y krb5-workstation && \
	mkdir /krb5 && chmod 755 /krb5


# add resources, the kinit script and the default krb5 configuration
ADD rekinit.sh /
ADD krb5.conf /etc/krb5.conf


# configure the exported volumes
 # /krb5 - default keytab location
 # /dev/shm - shared memory location used to write token cache
 # /etc/krb5.conf.d - directory for additional kerberos configuration
VOLUME ["/krb5","/dev/shm","/etc/krb5.conf.d"]

USER 1001

ENTRYPOINT ["/rekinit.sh"]

