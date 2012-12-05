#!/bin/sh 

NAME=opencast-matterhorn
VERSION=1.4.0-r13262-6

fpm -s dir -t deb -n $NAME -v $VERSION -d "openjdk-6-jre" -m "Kristof Keppens <k.keppens@ugent.be>" \
    --description "Opencast Matterhorn" --post-install post-install.sh \
    --pre-install pre-install.sh --pre-uninstall pre-remove.sh --post-uninstall post-remove.sh \
    /opt/matterhorn /etc/init.d/matterhorn /var/log/matterhorn
