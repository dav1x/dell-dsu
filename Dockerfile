FROM quay.io/centos/centos:8

RUN curl -O https://linux.dell.com/repo/hardware/dsu/bootstrap.cgi && bash bootstrap.cgi \
 && dnf install -y dell-system-update tar which \
 && dnf update -y \
 && curl -s https://linux.dell.com/repo/hardware/dsu/copygpgkeys.sh | bash 

ENTRYPOINT ["dsu" , "--import-public-key", "--non-interactive"]
