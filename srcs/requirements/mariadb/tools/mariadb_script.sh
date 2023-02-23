#!/bin/sh

mkdir -p /home/recarlie/data/mysql
mkdir -p /home/recarlie/data/wordpress

service mysql start & sleep 2

# Delete empty user
mysql -e "DELETE FROM mysql.user WHERE User='';"

# Create the database if it doesn't exists yet.
mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`;"

# Create the user specified in .env
mysql -e "CREATE USER IF NOT EXISTS '${WP_DB_USR}'@'localhost' IDENTIFIED BY '${WP_DB_PWD}';"

# Gives every rights to the user
mysql -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USR}'@'%' IDENTIFIED BY '${WP_DB_PWD}';"

# Changes the password of root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Refresh
mysql -e "FLUSH PRIVILEGES;"

# Relaunch
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
