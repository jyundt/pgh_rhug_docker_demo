#Dockerfile for RHUG demo app

FROM python:2
MAINTAINER "Jacob Yundt <jyundt@gmail.com>"
ENV DB_HOST rhug-db
ENV DB_PASS ovalpassword
ENV DB_USER oval
RUN /usr/bin/curl -v https://codeload.github.com/jyundt/oval/tar.gz/v0.1.9 | /bin/tar -zxvf - -C /root/
WORKDIR root/oval-0.1.9
RUN /usr/local/bin/pip install -r requirements.txt
CMD ["/usr/local/bin/uwsgi", "-s", "0.0.0.0:8080", "-w", "manage:app", "-T"]
EXPOSE 8080
