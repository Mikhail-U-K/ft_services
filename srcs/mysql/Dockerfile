FROM alpine:3.12.3
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
ENV DB_ROOT_PASS="mariadb_root_password"
ENV DB_PASS="mariadb_user_password"
ENV DB_PATH="/var/lib/mysql"
ENV DB_USER="mariadb_user"
RUN apk add openrc telegraf mariadb mariadb-common mariadb-client
RUN mysql_install_db --user=mysql --datadir=${DB_PATH}
VOLUME [ "/var/lib/mysql" ]
RUN openrc && touch /run/openrc/softlevel
COPY mariadb-server.cnf /etc/my.cnf.d
COPY ./telegraf.conf /etc/
COPY wordpress.sql .
COPY ./live_status.sh /
COPY start_mysql.sh .
ENTRYPOINT sh start_mysql.sh
EXPOSE 3306