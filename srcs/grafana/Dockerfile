FROM alpine:3.12.3

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add openrc grafana telegraf
RUN openrc && touch /run/openrc/softlevel

COPY ./grafana.db /usr/share/grafana/data/
COPY ./telegraf.conf /etc/
COPY ./grafana.ini /etc/
COPY ./live_status.sh /
COPY ./start_grafana.sh /
CMD sh start_grafana.sh
EXPOSE 3000