FROM maven:3.6.3-jdk-8 AS build
WORKDIR /home/app

COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/restful-web-services-0.0.1-SNAPSHOT.jar /usr/local/lib/restful-web-services-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/restful-web-services-0.0.1-SNAPSHOT.jar"]
