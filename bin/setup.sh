#!/bin/bash

echo "Starting setup..."
ldconfig

echo "Configure PostgreSQL"
sed -i 's|^#checkpoint_timeout = 5min|checkpoint_timeout = 1h|;s|^#checkpoint_warning = 30s|checkpoint_warning = 0|' /etc/postgresql/9.5/main/postgresql.conf

{ echo; echo "host all all 127.0.0.1/32 trust"; } >> "/etc/postgresql/9.5/main/pg_hba.conf"

echo "Starting Postgresql"
service postgresql start

echo "[PostgreSQL] Wait until postgresql is ready..."
sleep 1
until grep "database system is ready to accept connections" /var/log/postgresql/postgresql-9.5-main.log
do
	echo "[PostgreSQL] Waiting for PostgreSQL to start..."
	sleep 2
done

redis-server /etc/redis/redis.conf
sleep 1
while  [ "${X}" != "PONG" ]; do
        echo "[REDIS] Redis not yet ready"
        sleep 1
        X="$(redis-cli -s /tmp/redis.sock ping)"
done
echo "[REDIS] Redis ready."


echo "Configure database"
su - postgres -c "createuser -DRS root"
su - postgres -c "createdb -O root tasks"
su - postgres -c "psql tasks -c 'create role dba with superuser noinherit; grant dba to root; create extension \"uuid-ossp\";'"

echo "Making openvas certs"
openvas-manage-certs -f -a -q

echo "Sync Openvas NVTS"
greenbone-nvt-sync
sleep 10

echo "Starting openvas scanner and manager"
openvassd
until ps auxf | grep "Waiting for incoming connections"
do
        echo "Waiting for openvas scanner to start.."
        sleep 1
done

openvasmd

echo "Rebuilding openvasmd"
openvasmd --rebuild --progress -v
sleep 10

echo "Sync Openvas scapdata"
greenbone-scapdata-sync
sleep 10

echo "Sync Openvas certdata"
greenbone-certdata-sync

echo "Rebuilding Openvasmd..."
openvasmd --update --progress -v
echo "Creating Admin user..."
openvasmd --create-user=admin --role=Admin
echo "Setting Admin user password..."
openvasmd --user=admin --new-password=$OV_PASSWORD
echo "Creating Openvas scanner config file..."
openvassd -s > /etc/openvas/openvassd.conf
echo "Kill openvassd and openvasmd"
ps aux | grep openvassd| awk '{print $2}' |xargs kill -9
ps aux | grep openvasmd| awk '{print $2}' |xargs kill -9

echo "Graceful postgresql stop..."
service postgresql stop
echo "Finished setup..."

