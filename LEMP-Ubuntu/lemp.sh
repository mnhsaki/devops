#!/bin/bash

#nginx_installation

if [ ! -x /lib/systemd/system/nginx.service.d ]; then

        echo "INSTALLING LEMP"
echo    
echo    
        echo "INSTALLING nginx"
echo
echo
         apt install nginx -y
echo
echo
        ufw app info "Nginx Full"
echo
echo
        ufw allow in "Nginx Full"
	systemctl enable nginx
	systemctl start nginx
echo
echo
        echo "SUCESSFULLY INSTALLED nginx";

else
echo
echo
	
	echo "ALREADY INSTALLED nginx"
echo
echo
fi

#nginx_installation

#php_installation
if [ ! -x /usr/bin/php ]; then
echo
echo
        echo "INSTALLING php"
echo
echo
         apt install  php php-fpm php-mysql -y 

echo
echo
        echo "SUCESSFULLY INSTALLED php"
else
echo
echo
        echo "ALREADY INSTALLED php"
echo
echo
fi



#php_installation

#mysql_installation

if [ ! -x /usr/bin/mysql ]; then
echo
echo
        echo "INSTALLING mysql";
echo
echo
        apt install mysql-server -y 


echo
echo
mysql << EOF
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
EOF
echo "SUCESSFULLY REMOVED ANONYMOUS USER";
echo
echo
mysql <<EOF
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;
EOF

echo "SUCESSFULLY REMOTE ROOT LOGINS DISABLED";
echo
echo
mysql << EOF
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
EOF
echo "SUCESSFULLY test DATABASE REMOVED";
#mysql << EOF
#FLUSH PRIVILEGES;
#EOF
#echo "sucess";
echo
echo
mysql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
EOF
echo "USER:root PASSWORD:password CREATED SUCESSFULLY";
echo
echo
        echo "SUCESSFULLY INSTALLED mysql";

else
echo
echo
        echo "ALREADY INSTALLED mysql"
echo
echo
fi

#mysql_installation
