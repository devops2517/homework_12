FROM maven:3.6.3-jdk-8 AS build
WORKDIR /homework_12
RUN apt install git
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
COPY Config.properties App42PaaS-Java-MySQL-Sample/WebContent
RUN cd App42PaaS-Java-MySQL-Sample
RUN mvn clean
RUN mvn install
RUN mvn package -DskipTests

FROM tomcat:alpine
COPY --from=build /homework_12/App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
