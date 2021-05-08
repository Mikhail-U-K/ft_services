FROM alpine:3.12.3

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add openrc influxdb telegraf
RUN openrc && touch /run/openrc/softlevel

VOLUME [ "/var/lib/influxdb" ]
COPY ./telegraf.conf /etc/
COPY start_influxdb.sh .
COPY live_status.sh /
ENTRYPOINT sh start_influxdb.sh
EXPOSE 8086