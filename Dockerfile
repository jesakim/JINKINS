FROM  maven:3.9.6-eclipse-temurin-17-alpine AS build

WORKDIR /app

COPY ./pom.xml ./pom.xml

COPY ./src ./src

RUN mvn clean package  -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/devopsdemo-0.0.1.jar /app/app.jar

EXPOSE 8080


CMD ["java", "-jar", "app.jar"]
