#!/bin/sh 

NAME=opencast-matterhorn
VERSION=1.4.0-1-r147589

fpm -s dir -t deb -n $NAME -v $VERSION -d "openjdk-6-jre" -m "Kristof Keppens <k.keppens@ugent.be>" \
    --description "Opencast Matterhorn" --post-install post-install.sh \
    --pre-install pre-install.sh --pre-uninstall pre-remove.sh --post-uninstall post-remove.sh \
    --config-files /opt/matterhorn/etc/config.properties --config-files /opt/matterhorn/etc/factories/org.opencastproject.userdirectory.ldap.properties \
    --config-files /opt/matterhorn/etc/security/mh_default_org.xml --config-files /opt/matterhorn/etc/services/org.ops4j.pax.logging.properties \
    --config-files /opt/matterhorn/etc/services/org.opencastproject.workflow.impl.WorkflowServiceImpl.properties \
    --config-files /opt/matterhorn/etc/services/org.opencastproject.usertracking.impl.UserTrackingServiceImpl.properties \
    --config-files /opt/matterhorn/etc/services/org.opencastproject.oaipmh.harvester.OaiPmhHarvester.properties \
    /opt/matterhorn /etc/init.d/matterhorn /var/log/matterhorn
