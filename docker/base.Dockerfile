FROM java:8

#WORKDIR /code
RUN mkdir -p /code && rm -rf /code/*
COPY * /code/
COPY .mvn /code/.mvn/
COPY src /code/src/
RUN cd /code && ls -hal /code && ./mvnw package -D maven.test.skip=true && rm -rf /code

EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
