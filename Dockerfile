FROM maven:3.9.9-eclipse-temurin-24 AS build
WORKDIR /build
COPY src /build/pom.xml
RUN mvn clean package

FROM eclipse-temurin:21-alpine
COPY --from=build /build/target/*.jar /opt/app.jar
CMD ["java", "-jar", "/opt/app.jar"]