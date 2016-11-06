#!/bin/bash
SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
JAVA_ARGS="-Dsbt.ivy.home=project/.ivy"
java $SBT_OPTS $JAVA_ARGS -jar `dirname $0`/sbt-launch.jar "$@"
