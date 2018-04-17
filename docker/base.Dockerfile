FROM java:8

#WORKDIR /code
RUN mkdir -p /cood
COPY * /code/
COPY .mvn /code/.mvn/
COPY src /code/src/
RUN cd /code && ls -hal /code && ./mvnw package -D maven.test.skip=true || echo 'fail test'

#&& cp /code/targe/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
