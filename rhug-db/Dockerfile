
FROM postgres:9
MAINTAINER "Jacob Yundt <jyundt@gmail.com>"
ENV POSTGRES_USER oval
ENV POSTGRES_PASSWORD ovalpassword
ENV POSTGRES_DB oval
ADD oval_db_2016-04-25-09-26.sql /docker-entrypoint-initdb.d/ 
