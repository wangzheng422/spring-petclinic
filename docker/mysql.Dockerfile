FROM mysql:5

ADD src/main/resources/db/mysql/schema.sql /docker-entrypoint-initdb.d/1.sql
ADD src/main/resources/db/mysql/data.sql /docker-entrypoint-initdb.d/2.sql

ENV MYSQL_DATABASE petclinic