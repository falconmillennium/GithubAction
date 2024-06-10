FROM maven:3.8-jdk-11 AS build

WORKDIR /project

COPY ./javaapp/ /project

RUN mvn clean package

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /project/target/my-first-app-on-aws-ecr-1.0-SNAPSHOT.jar ./

CMD ["java", "-jar", "./my-first-app-on-aws-ecr-1.0-SNAPSHOT.jar"]
