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
# MARIADB
	RUN apt-get -y install mariadb-server
#
#################

################################
# Manage MARIADB configuration #
################################
#
# Copy from local folder Inception's MariaDB configuration file
	COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# Copy from local folder SQL setup script
	COPY /tools/mariadb_script.sh mariadb_script.sh
    RUN chmod +x mariadb_script.sh
# Create useful folders
    RUN mkdir -p /run/mysqld
    RUN mkdir -p /var/lib/mysql
    RUN chown -R mysql /var/lib/mysql
    RUN chmod 777 /var/lib/mysql
#
##############################

##################
# Port listening #
##################
#
	EXPOSE 3306
#
##################

###############
# Run MariaDB #
###############
#
    ENTRYPOINT ["./mariadb_script.sh"]
#
#############
