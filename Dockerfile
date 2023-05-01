FROM openjdk:8-jdk-alpine

RUN apk update && apk add --no-cache git

WORKDIR /app
COPY . /app

RUN apk add --no-cache curl && \
    curl -L -o mysql-connector-java.jar https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git && \
    mkdir /app/ && \
    chmod +x start-my-app-command.sh

ENV CLASSPATH=/app/mysql-connector-java.jar

CMD ["sh", "-c", "./start-my-app-command.sh"]

