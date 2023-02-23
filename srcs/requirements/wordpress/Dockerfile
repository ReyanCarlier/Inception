#########################################
# REYAN CARLIER - 2022-2023 - Inception #
# login : recarlie                      #
# mail  : recarlie@student.42.fr        #
# mail2 : reyan@bde42.fr                # 
#########################################

####################
# Select Kernel OS #
####################
#
	FROM debian:buster
#
####################

#################
# Update system #
#################
#
	RUN apt-get -y update
	RUN apt-get -y upgrade
#
#################

#################
# Install tools #
#################
#
# WGET
	RUN apt-get -y install wget
# PHP
	RUN apt-get -y install php7.3 php-fpm php-mysqli
	COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
# MariaDB client
	RUN apt-get -y install mariadb-client
# Bonus
	RUN apt-get -y install sendmail
#
#################

######################
# Download Wordpress #
######################
#
# Download Wordpress
#	RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
#	RUN cd /var/www/html && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm -rf wordpress-6.0-fr_FR.tar.gz
#	RUN chown -R root:root /var/www/html/wordpress
# Download Wordpress CLI for setup
	RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	RUN chmod -x wp-cli.phar
	RUN mv wp-cli.phar /usr/bin/wp
	COPY ./tools/wordpress_script.sh ./
	COPY ./conf/wp-config.php ./
    RUN chmod +x ./wordpress_script.sh
#
##############################

##################
# Port listening #
##################
#
	EXPOSE 9000
#
##################

#############
# Run Setup #
#############
#
	ENTRYPOINT ["sh", "/wordpress_script.sh"]
#
#############
