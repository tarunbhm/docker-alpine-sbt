FROM tarunbhm/docker-alpine-oraclejdk8
MAINTAINER Tarun Bansal <tarunbhm@gmail.com>

# install wget and ca-certificates
# RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates

# install bash because sbt scripts use bash
RUN apk add --no-cache bash

# set SBT version
ENV SBT_VERSION 0.13.11
ENV SBT_JAR     https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar

# download SBT
ADD $SBT_JAR /usr/local/bin/sbt-launch.jar

# copy SBT run script
COPY sbt /usr/local/bin/sbt
RUN chmod u+x /usr/local/bin/sbt

# run SBT for first time so that it download dependencies
RUN sbt

VOLUME "/app"
WORKDIR /app

EXPOSE 9000 
EXPOSE 9999

ENTRYPOINT ["sbt"]
