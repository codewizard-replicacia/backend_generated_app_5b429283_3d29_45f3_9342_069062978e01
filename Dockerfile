FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_5b429283_3d29_45f3_9342_069062978e01 backend_generated_app_5b429283_3d29_45f3_9342_069062978e01
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_5b429283_3d29_45f3_9342_069062978e01/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]