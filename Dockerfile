FROM openjdk:8-jdk-alpine

RUN apk update && apk add --no-cache curl

WORKDIR /app

RUN curl -L -o mysql-connector-java.jar https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git

COPY start-my-app-command.sh .
COPY mysql-connector-java.jar .
COPY config.properties /App42PaaS-Java-MySQL-Sample/src/main/resources/

ENV CLASSPATH=/app/mysql-connector-java.jar

CMD ["sh", "-c", "./start-my-app-command.sh"]

