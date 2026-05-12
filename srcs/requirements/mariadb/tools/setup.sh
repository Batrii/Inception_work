#!/bin/bash

set -e
#create the folder 3la 9bal mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

#run mysql in the background bach nsayb database w users
mysqld_safe &

# ntsnaw mysql ykhdem
until mysqladmin ping --silent; do
    echo "Waiting for MySQL to start..."
    sleep 4
done

# ila database ma kaynach ki creaha
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# ila user ma kaynach ki creaha w 3tiha les privileges
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# grant privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"

#kayrefreshi permissions bach mysql y3rf les changements
mysql -e "FLUSH PRIVILEGES;"

# kaytfi mysql server 
mysqladmin shutdown

exec mysqld