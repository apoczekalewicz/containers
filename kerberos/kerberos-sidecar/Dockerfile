FROM registry.access.redhat.com/ubi8

RUN 	yum install -y krb5-workstation openssh-clients && \
	mkdir /krb5 && chmod 755 /krb5


# add resources, the kinit script and the default krb5 configuration
ADD rekinit.sh /
ADD krb5.conf /etc/krb5.conf


# configure the exported volumes
 # /krb5 - default keytab location
 # /dev/shm - shared memory location used to write token cache
VOLUME ["/krb5","/dev/shm"]

USER 1001

ENTRYPOINT ["/rekinit.sh"]

