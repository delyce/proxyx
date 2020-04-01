FROM alpine:latest

RUN apk update
RUN apk upgrade

RUN apk --no-cache add tzdata
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apk del tzdata

RUN apk --no-cache add nginx
RUN mkdir /run/nginx

RUN apk --no-cache add certbot

RUN mkdir -p /etc/skel
COPY ./skel/server.conf /etc/skel/
COPY ./skel/ssl_server.conf /etc/skel/
COPY ./bin/certadd /usr/local/bin/
COPY ./bin/certdel /usr/local/bin/
COPY ./bin/certrenew /usr/local/bin/
RUN chmod a+x /usr/local/bin/certadd
RUN chmod a+x /usr/local/bin/certdel
RUN chmod a+x /usr/local/bin/certrenew
