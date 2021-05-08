FROM alpine:3.12.3

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openssl openrc telegraf && mkdir /run/nginx;
RUN apk add wget php7-common php7-iconv php7-json php7-gd php7-curl \
php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
php7-ctype php7-dom php php-fpm php-session php-mbstring php-gettext \
php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

COPY default.conf /etc/nginx/conf.d/
COPY ./telegraf.conf /etc/
COPY config.inc.php .
COPY live_status.sh /
COPY start_php.sh .
RUN mkdir -p /usr/share/webapps/
RUN set -x ; addgroup -g 82 -S www-data ; adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
WORKDIR /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
mv /config.inc.php /usr/share/webapps/phpmyadmin
WORKDIR /
ENTRYPOINT sh start_php.sh
EXPOSE 5000