FROM java:8-jre-alpine
MAINTAINER flozano@gmail.com

ENV LIQUIBASE_URL https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.0/liquibase-3.5.0-bin.tar.gz
ENV MYSQL_URL https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.38.tar.gz 

RUN true \
 && apk update \
 && apk add curl \
 && apk add tar \
 && apk add bash \
 && curl -fSL $LIQUIBASE_URL -o /tmp/liquibase.tgz \
 && curl -fSL $MYSQL_URL -o /tmp/mysql.tgz \
 && mkdir /liquibase \
 && mkdir /tmp/mysql \
 && tar -xvf /tmp/liquibase.tgz -C /liquibase \
 && tar -xvf /tmp/mysql.tgz -C /tmp/mysql --strip-components=1 \
 && cp /tmp/mysql/*.jar /liquibase/lib \
 && rm /tmp/liquibase.tgz \
 && rm /tmp/mysql.tgz \
 && ln -s /liquibase/liquibase /bin/liquibase \

 && true

 ENTRYPOINT [ "/bin/bash" ]