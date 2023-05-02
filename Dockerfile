
RUN apk update && \
    apk add --no-cache curl && \
    mkdir -p /app/App42PaaS-Java-MySQL-Sample

WORKDIR /app

RUN wget -O mysql-connector-java.jar https://github.com/shephertz/App42PaaS-Java-MySQL-Sample/raw/master/lib/mysql-connector-java-5.1.34-bin.jar

COPY start-my-app-command.sh /app/App42PaaS-Java-MySQL-Sample
COPY config.properties /app/App42PaaS-Java-MySQL-Sample/src/main/resources/

ENV CLASSPATH=/app/mysql-connector-java.jar

CMD ["sh", "-c", "cd /app/App42PaaS-Java-MySQL-Sample && ./start-my-app-command.sh"]


