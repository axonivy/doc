FROM maven:3.9.9-eclipse-temurin-21 AS m2-cache

# copy all poms and project root files. See .dockerignore
COPY . /usr/src/mvn
WORKDIR /usr/src/mvn

USER ubuntu

# downloads dependencies ('mvn dependency:go-offline' is not working with tycho)
RUN mvn --batch-mode --settings jenkins/settings.xml --threads 4 validate -Dmaven.plugin.validation=NONE 

FROM maven:3.9.9-eclipse-temurin-21

# install iproute2 which contains ss (a native program to get all open sockets, needed in some ci tests)
RUN apt-get update && \
    apt-get install -y iproute2 && \
    rm -rf /var/lib/apt/lists/*

USER ubuntu

COPY --from=m2-cache /home/ubuntu/.m2/ /home/ubuntu/.m2/
