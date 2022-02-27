# docker-rundeck

An extremely (and intentionally) simple container wrapping of Rundeck.

## Building

You need to download the Rundeck war file yourself. Check this project out, pop the war file into the project root directory (next to the Dockerfile), and docker build the sucker (or buildah).

## Run-Time Configuration

***JVM_OPTS***

Classic JVM options, as passed to Java.

Defaults to ```"-Xms256m -Xmx1024m"```.

***RDECK_JVM_OPTS***

Rundeck-specific JVM options. Functionally identical to ```JVM_OPTS```, just
helps to visually separate Rundeck tunables from Java's.

Defaults to ```"-Drdeck.base=/var/rundeck/home"```.

## Some Useful Things to Know

* Rundeck is installed to /var/rundeck.
* The rundeck home directory defaults to /var/rundeck/data. This is a volume.
* /var/rundeck/run.sh is the entrypoint.
* Rundeck runs as rundeck:rundeck (1000:1000).
