#!/bin/sh

case "$1" in
    upgrade|remove)
        if [ -x "/etc/init.d/matterhorn" ]; then
            service matterhorn stop
        fi
        sleep 2
        ;;
esac
