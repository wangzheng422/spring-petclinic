FROM java:8

WORKDIR /code
ADD * /code/
ADD .mvn /code
RUN cd /code && ls -hal && ./mvnw spring-boot:repackage && cp /code/targe/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
