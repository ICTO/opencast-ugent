#!/bin/sh

if [ -x "/etc/init.d/matterhorn" ]; then
    service matterhorn stop
    sleep 2
fi
