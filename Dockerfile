FROM openjdk:8-jdk-alpine

RUN apk update && apk add --no-cache git

WORKDIR /app
COPY . /app

RUN apk add --no-cache curl && \
    curl -L -o mysql-connector-java.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar && \
    mkdir /app/ && \
    chmod +x start-my-app-command.sh

ENV CLASSPATH=/app/mysql-connector-java.jar

CMD ["sh", "-c", "./start-my-app-command.sh"]