#!/bin/bash


##
# Update & install Ubuntu packege 
##
apt-get -y update && sudo apt upgrade
apt-get -y install python-software-properties software-properties-common ca-certificates lsb-release apt-transport-https


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
        sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath -y 
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

echo "# vHosts crete Start. "

>| /etc/nginx/sites-available/default
cat <<EOF > /etc/nginx/sites-available/default
server {
        listen *:80;
        server_name localhost;
        index index.php index.html index.htm;

        root /usr/share/nginx/html;

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
               root /usr/share/nginx/html;
        }

        location ~ \.php\$ {
	       try_files \$uri =404;
               fastcgi_split_path_info ^(.+\.php)(/.+)\$;
               fastcgi_pass 127.0.0.1:9000;
               fastcgi_index index.php;
               include fastcgi_params;
        }

        location ~ /\.ht {
               deny all;
        }
}
EOF
cat <<EOF > /etc/nginx/sites-available/php-vhost
server {
    listen       *:80;

    server_name  localhost;
    set    \$root_path '/var/www/php_public';

    root   \$root_path;
    index  index.php index.html index.htm;
    try_files \$uri \$uri/ @rewrite;

    location @rewrite {
        rewrite ^/(.*)\$ /index.php?_url=/\$1;
    }

    location ~ \.php\$ {
            try_files \$uri =404;
            fastcgi_pass 127.0.0.1:9000;
            fastcgi_index index.php;
            fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;

            include fastcgi_params;
    }

    location ~* ^/(css|img|js|flv|swf|download)/(.+)\$ {
        root \$root_path;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF
cat <<EOF > /usr/share/nginx/html/info.php
<? phpinfo(); ?>
EOF
echo "# vHosts crete Finished. "



#mysql_installation
echo "# mysql install start. "

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
echo
echo
echo "USER:root PASSWORD:password CREATED SUCESSFULLY";
echo
echo
echo "SUCESSFULLY INSTALLED MYSQL";
echo
echo
else
echo
echo
        echo "ALREADY INSTALLED MYSQL"
echo
echo
fi

echo "# MYSQL install Finished. "
#mysql_installation



#Java_installation
if [ ! -x /usr/bin/java ]; then
echo
echo
        echo "INSTALLING JAVA"
echo
echo
        sudo apt install openjdk-11-jre-headless -y
echo
echo
        echo "SUCESSFULLY INSTALLED Java"
else
echo
echo
        echo "ALREADY INSTALLED java"
        java -version
echo
echo
fi

#Java_installation


#phpMyadmin installation

if [ ! -x /usr/bin/phpMyadmin ]; then
echo
echo
        echo "INSTALLING phpMyadmin"
echo
echo
        sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
echo
echo
        echo "SUCESSFULLY INSTALLED phpMyadmin"
else
echo
echo
        echo "ALREADY INSTALLED phpMyadmin"
echo
echo
fi

#phpMyadmin installation


#git installation

if [ ! -x /usr/bin/git ]; then
echo
echo
        echo "INSTALLING git"
echo
echo
        sudo apt install git -y
echo
echo
        echo "SUCESSFULLY INSTALLED git"
else
echo
echo
        echo "ALREADY INSTALLED git"
echo
echo
fi

#git installation



cd
clear
echo "###"
echo "#"
echo "# LEMP + vHosts Install Finished + JAVA. "
echo "#"
echo "# 1. Dont forget to update your hosts file '/etc/hosts/' redirecting the vhosts to your Vagrant VM IP."
echo "# 2. You can check your php install on [http://{{ host ip}}/info.php]"
echo "#"
echo "###"