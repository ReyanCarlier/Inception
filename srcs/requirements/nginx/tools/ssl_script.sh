if [ ! -e /etc/nginx/ssl/inception.crt ]; then

	echo "[INCEPTION] - Setting up OpenSSL for Nginx. . .";
	openssl req \
		-x509 \
		-nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=recarlie.42.fr/UID=recarlie"
	
	echo "[INCEPTION] - OpenSSL configured succesfully !";
fi
