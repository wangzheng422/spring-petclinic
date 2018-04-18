FROM spring-petclinic:base

RUN mkdir -p /code && rm -rf /code/*
COPY pom.xml /code/
COPY mvnw /code/
COPY .mvn /code/.mvn
COPY src /code/src/
RUN cd /code && ./mvnw package -D maven.test.skip=true && cp /code/target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /app.jar && rm -rf /code/

EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
