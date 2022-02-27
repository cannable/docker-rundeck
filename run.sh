#!/bin/bash

# ------------------------------------------------------------------------------
# Rundeck Startup Script
# ------------------------------------------------------------------------------

groupadd -g 1000 rundeck
useradd -m -u 1000 -g rundeck rundeck

# Create user and apply up permissions

chown -R rundeck:rundeck /var/rundeck
chmod 750 /var/rundeck

find /var/rundeck -type d ! -perm 0750 -exec chmod 0750 \{\} \;
find /var/rundeck -type f ! -perm 0640 -exec chmod 0640 \{\} \;

chmod 750 /var/rundeck/run.sh

# Start Rundeck
su -s /bin/bash -c "java ${JVM_OPTS} ${RDECK_JVM_OPTS} -jar /var/rundeck/rundeck.war" rundeck
