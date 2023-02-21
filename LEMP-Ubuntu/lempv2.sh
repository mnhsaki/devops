##
# Installing all resources 
##
apt-get -y update && upgrade
apt-get -y install python-software-properties software-properties-common
add-apt-repository -y ppa:nginx/stable
apt-get -y update
apt-get -y install make autoconf gcc nano git-core nginx php7 php7-cli php7-dev php7-fpm php7-mysql php7-curl php7-memcache php7-gd php7-mcrypt php7-xmlrpc php7-sqlite

##
# non dialog mysql install
# user: root | pass: root
##
echo mysql-server mysql-server/root_password password root | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password root | sudo debconf-set-selections
apt-get -y install mysql-server mysql-client


##
# configuring php.ini
#
# enabling short_tags.
# enabling pathinfo for FPM.
# enabling display_errors.
##
sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php7/fpm/php.ini
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php7/fpm/php.ini
sed -i 's/display_errors = Off/display_errors = On/' /etc/php7/fpm/php.ini

##
# configuring nginx
#
# decreasing timeout.
# turning sendfiles off.
# include php extension to default sites.
# creating a foo_vhost file for phalcon.
# creating a phpinfo file.
##
sed -i 'keepalive_timeout 65;/keepalive_timeout 2;/' /etc/nginx/nginx.conf
sed -i 'sendfile on;/sendfile off;/' /etc/nginx/nginx.conf

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
cat <<EOF > /etc/nginx/sites-available/foo-vhost
server {
    listen       *:80;

    server_name  foo.dev www.foo.dev;
    set    \$root_path '/var/www/foo_public';

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

##
# restarting services
##
service php7-fpm restart && service nginx restart


cd
clear
echo "###"
echo "#"
echo "# LEMP + Phalcon + vHosts Install Finished. "
echo "#"
echo "# 1. Dont forget to update your hosts file '/etc/hosts/' redirecting the vhosts to your Vagrant VM IP."
echo "# 2. You can check your php install on [http://{{ vagrant host }}/info.php]"
echo "#"
echo "###"