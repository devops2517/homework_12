FROM openjdk:8-jdk-alpine

RUN apt-get update && apt-get install -y git

WORKDIR /app
COPY . /app

RUN apk add --no-cache \
    curl \
    && curl -L -o mysql-connector-java.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar \
    && rm -rf /var/cache/apk/* \
    && mkdir /app/tmp

ENV CLASSPATH=/app/mysql-connector-java.jar

CMD ["sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -jar App42PaaS-Java-MySQL-Sample.jar"]