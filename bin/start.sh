#!/bin/bash

echo "Starting Openvas..."

service postgresql start

echo "Wait until postgresql is ready"

until grep "database system is ready to accept connections" /var/log/postgresql/postgresql-9.5-main.log 
do
        echo "Waiting for PostgreSQL to start..."
        sleep 1
done

echo "Starting Redis..."
redis-server /etc/redis/redis.conf

sleep 1
while  [ "${X}" != "PONG" ]; do
        echo "[REDIS] Redis not yet ready"
        sleep 1
        X="$(redis-cli -s /tmp/redis.sock ping)"
done
echo "[REDIS] Redis ready."

cd /usr/local/sbin

echo "Starting gsad for debug"
# http://wiki.openvas.org/index.php/Edit_the_SSL_ciphers_used_by_GSAD
./gsad --mlisten 127.0.0.1 -m 9390 --gnutls-priorities=SECURE128:-AES-128-CBC:-CAMELLIA-128-CBC:-VERS-SSL3.0:-VERS-TLS1.0 --allow-header-host=$PUBLIC_HOSTNAME

echo "Starting Openvassd"
./openvassd
until ps auxf | grep "Waiting for incoming connections"
do
        echo "Waiting for openvas scanner to start.."
        sleep 1
done

echo "Starting Openvasmd"
./openvasmd -a 127.0.0.1 -p 9390 --max-ips-per-target=65536

echo "Update portmap names..."
wget http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml
./openvas-portnames-update service-names-port-numbers.xml
rm -rf service-names-port-numbers.xml

echo "Finished startup"

tail -f /var/log/openvas/*
