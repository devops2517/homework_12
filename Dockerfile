FROM openjdk:8-jdk-alpine

RUN apk update && apk add --no-cache git

WORKDIR /app

# Если папка не существует, клонируем репозиторий
RUN if [ ! -d "/app/App42PaaS-Java-MySQL-Sample" ]; then \
      git clone https://github.com/username/repo.git /app/App42PaaS-Java-MySQL-Sample; \
    fi

COPY start-my-app-command.sh .
COPY mysql-connector-java.jar .
COPY config.properties /App42PaaS-Java-MySQL-Sample/src/main/resources/

ENV CLASSPATH=/app/mysql-connector-java.jar

CMD ["sh", "-c", "./start-my-app-command.sh"]

