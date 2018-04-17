FROM java:8

RUN apt-get -y update && apt-get -y install maven

WORKDIR /code
ADD * /code/
RUN cd /code && mvn package && cp /code/targe/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
