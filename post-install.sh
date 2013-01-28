#!/bin/sh

set -e

MATTERHORN_HOME=/opt/matterhorn
MATTERHORN_USER=matterhorn
MATTERHORN_GROUP=matterhorn

case "$1" in
    configure)
        #start opencast matterhorn on boot
        update-rc.d matterhorn defaults 99

        #Create matterhorn group if not exists
        if ! getent group matterhorn > /dev/null; then
            groupadd matterhorn
        fi

        #Create matterhorn user if it not exists
        if ! getent passwd matterhorn > /dev/null; then
            adduser --home $MATTERHORN_HOME \
                    --system \
		    --shell /bin/bash \
                    --group \
                    --no-create-home \
                    --disabled-password \
                    --quiet $MATTERHORN_USER 
        fi

        #Fix ownership folders
        chown $MATTERHORN_USER:$MATTERHORN_GROUP /var/log/matterhorn

        #Fix ownership opencast install
        chown -R $MATTERHORN_USER:$MATTERHORN_GROUP /opt/matterhorn
esac
