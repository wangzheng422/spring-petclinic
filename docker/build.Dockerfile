FROM spring-petclinic:base

WORKDIR /code
COPY pom.xml /code/
COPY mvnw /code/
COPY .mvn /code/.mvn
RUN cd /code && ./mvnw package -D maven.test.skip=true && cp /code/target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
