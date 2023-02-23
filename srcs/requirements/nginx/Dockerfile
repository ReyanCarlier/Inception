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
#	not working utils :
	#RUN apt-get -y install apt-utils
#
#################

#################
# Install tools #
#################
#
# NGINX
	RUN apt-get -y install nginx
# NANO (lol, not vim sorry)
#
	RUN apt-get install nano -y
# CURL
	RUN apt-get install curl -y
# Install OpenSSL and LibSSL-dev package
	RUN apt-get install openssl libssl-dev -y

###########################
# Manage SSL certificates #
###########################
#
# Create /etc/nginx/ssl directory if it doesn't exist
	RUN mkdir -p /etc/nginx/ssl
# Copy from local files our installation script
	COPY /tools/ssl_script.sh /cert.sh
# Run the script
	RUN sh cert.sh
# Delete it after installation
	RUN rm cert.sh
#
###########################

##############################
# Manage NGINX configuration #
##############################
#
# Create /var/run/nginx folder
	RUN mkdir -p /var/run/nginx
# Copy from local folder Inception's Nginx configuration file
	COPY /conf/nginx.conf /etc/nginx/nginx.conf
# Copy from local folder default site file
	COPY /conf/default /etc/nginx/sites-enabled/default
#
##############################

###################
# Acces to things #
###################
#
	RUN mkdir -p /var/www/html/wordpress
	RUN chmod 755 /var/www/html
	RUN chmod 777 /var/www/html/wordpress
	RUN chown -R www-data:www-data /var/www/html/wordpress
#
###################

##################
# Port listening #
##################
#
	EXPOSE 443
#
##################

#############
# Run NGINX #
#############
#
	CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
#
#############
