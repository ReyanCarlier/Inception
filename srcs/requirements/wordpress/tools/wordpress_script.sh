#!/bin/sh

sleep 20

#chown -R www-data:www-data /var/www/*;
#chown -R 755 /var/www/*;
mkdir -p /run/php/;
chmod +x /usr/bin/wp;

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	mkdir -p /var/www/html/wordpress;
	#mkdir -p /var/www/html/wordpress;
	#chmod -R 755 /var/www/html/wordpress;
	#cd /var/www/html/wordpress;
	wp core download --allow-root --path="/var/www/html/wordpress";
    rm -f /var/www/html/wordpress/wp-config.php
    cp /wp-config.php /var/www/html/wordpress/wp-config.php
	#wp config create --allow-root --dbname=$WP_DB_NAME \
	#	--dbuser=$WP_DB_USR \
	#	--dbpass=$WP_DB_PWD \
	#	--dbhost=$SQL_HOST \
	#	--path=/var/www/html/wordpress;
	wp core install --allow-root \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_MAIL \
		--path="/var/www/html/wordpress"
	#sed -i "s/__DIR__ . '\/'/'\/var\/www\/html\/wordpress'/g" /var/www/html/wordpress/wp-config.php
    wp user create $WP_USR $WP_MAIL --role=author --user_pass=$WP_PWD --allow-root --path="/var/www/html/wordpress"
	wp theme install --allow-root \
		--path=/var/www/html/wordpress/ \
		twentysixteen --activate
	wp cache flush --allow-root \
		--path="/var/www/html/wordpress"
fi

exec /usr/sbin/php-fpm7.3 -F -R
