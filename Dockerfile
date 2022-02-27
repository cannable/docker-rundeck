FROM ubuntu:18.04

# NOTE: You must download rundeck.war yourself and place it in this directory.

ENV JVM_OPTS="-Xms256m -Xmx1024m"
ENV RDECK_JVM_OPTS="-Drdeck.base=/var/rundeck/home"

VOLUME ["/var/rundeck/data"]

RUN mkdir -p /var/rundeck/home && \
        apt-get update && \
        apt-get --no-install-recommends -y install openjdk-11-jre-headless && \
        apt-get -y clean && \
        rm -rf /var/lib/apt/lists/*

COPY rundeck.war /var/rundeck/
COPY ./run.sh /var/rundeck/run.sh

EXPOSE "4440/tcp"

ENTRYPOINT ["/bin/bash", "/var/rundeck/run.sh"]
