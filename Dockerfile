FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app

RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git \
    && cd App42PaaS-Java-MySQL-Sample \
    && mvn clean \
	&& mvn install \
    && mvn package -DskipTests

FROM tomcat:alpine
COPY --from=build /app/target/App42PaaS-Java-MySQL-Sample.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
