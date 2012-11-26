#!/bin/sh 

NAME=opencast-matterhorn
VERSION=1.4.0-r13262-4

fpm -s dir -t deb -n $NAME -v $VERSION -d "openjdk-6-jre" -m "Kristof Keppens <k.keppens@ugent.be>" \
    --description "Opencast Matterhorn" --post-install post-install.sh \
    /opt/matterhorn /etc/init.d/matterhorn /var/log/matterhorn /var/run/matterhorn
