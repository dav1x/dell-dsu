#!/bin/bash
/opt/dell/srvadmin/sbin/srvadmin-services.sh start
/usr/sbin/dsu --import-public-key --non-interactive
