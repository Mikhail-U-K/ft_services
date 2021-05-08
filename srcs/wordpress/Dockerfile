FROM alpine:3.12.3

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx telegraf openrc && mkdir /run/nginx;
RUN apk add php7-common php7-curl php7-xml php7-mysqli \
php7-imap php7-cgi fcgi php7-iconv php7-json php7-gd \
php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php php-fpm

WORKDIR /var/www/localhost/htdocs
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
WORKDIR /
COPY wp-config.php /var/www/localhost/htdocs/wordpress
COPY default.conf /etc/nginx/conf.d
COPY ./telegraf.conf /etc/
COPY live_status.sh /
COPY start_wp.sh .
EXPOSE 5050
ENTRYPOINT sh start_wp.sh
