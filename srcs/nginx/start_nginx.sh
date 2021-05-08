openrc
touch /run/openrc/softlevel
rc-status
/etc/init.d/telegraf start
nginx -g 'daemon off;'