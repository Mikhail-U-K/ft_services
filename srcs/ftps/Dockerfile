FROM alpine:3.12.3

ENV ip=192.168.99.113
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk update
RUN apk add pure-ftpd openssl
RUN adduser -D admin && echo admin:admin | chpasswd
RUN mkdir -p ftps/admin
RUN apk add telegraf openrc && openrc && touch /run/openrc/softlevel
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem
COPY ./telegraf.conf /etc/
COPY start_ftps.sh /
COPY probe.sh /
CMD sh start_ftps.sh
EXPOSE 21 21000