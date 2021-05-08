FROM alpine:3.12.3

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openssl openrc telegraf && mkdir /run/nginx/;

RUN adduser -D admin -G root && echo "admin:admin" | chpasswd
RUN echo "<h1>WelCUM to NGINX.</h1>" > /var/www/localhost/htdocs/index.html;
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

COPY default.conf /etc/nginx/conf.d
COPY ./telegraf.conf /etc/
COPY start_nginx.sh .
COPY live_status.sh /
EXPOSE 80 443
CMD sh start_nginx.sh