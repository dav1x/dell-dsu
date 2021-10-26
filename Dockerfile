FROM quay.io/centos/centos:8

ENV PATH $PATH:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin

COPY run-dsu.sh /run-dsu.sh

RUN curl -O https://linux.dell.com/repo/hardware/dsu/bootstrap.cgi && bash bootstrap.cgi \
 && dnf install -y dell-system-update tar which gcc wget dmidecode kernel-core-$(uname -r) srvadmin-hapi srvadmin-omcommon \
 && dnf update -y \
 && curl -s https://linux.dell.com/repo/hardware/dsu/copygpgkeys.sh | bash \
 && chmod +x /run-dsu.sh

ENTRYPOINT ["/run-dsu.sh"]
