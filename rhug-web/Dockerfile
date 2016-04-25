#Dockerfile for RHUG demo app

FROM nginx:1.8
MAINTAINER "Jacob Yundt <jyundt@gmail.com>"
RUN /bin/rm /etc/nginx/conf.d/default.conf
COPY oval-app.conf /etc/nginx/conf.d/

