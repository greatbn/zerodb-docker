FROM frolvlad/alpine-python2:latest

MAINTAINER michael@zerodb.io

ENV ZEROBD_SERVER_VERSION 0.1.23

RUN apk -U --no-progress add ca-certificates gcc build-base python-dev libffi-dev && \
    pip install --upgrade zerodb-server==$ZEROBD_SERVER_VERSION && \
    apk del gcc build-base python-dev libffi-dev

WORKDIR /server

COPY ./files/conf      /conf
COPY ./files/start.sh  /start.sh

RUN mkdir /data

VOLUME /data

EXPOSE 8001 8001

CMD /start.sh
