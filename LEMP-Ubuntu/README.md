## LEMP Installation, Nginix,Mysql and Php shell script for ubuntu OS's.

  
   **Automated installation script for LEMP current versions of Nginx, mysql and php for ubuntu OS's.**

   ### Setup Guide
## Prerequiste:
  
   * Ubuntu OS.
  
   * Make sure you have already installed Ubuntu to continue. more at [ubuntu.com](http://www.ubuntu.com/)

### Setup Guide

* **Step 1:** Executing the Script

> Make sure you are the root user otherwise some resources wont be installed.
>
```
$ sudo su
```

* **Step 2:** Cloning the repository

```
$ git clone https://github.com/mnhsaki/devops.git
```

   * Download the script.

* **Step 3:** Change directory

```
$ cd /LEMP-Ubuntu
```

   * change the file permission with 777 
  
```
sudo chmod 777 lemp.sh 
```

   * Run the script with sudo.  
  
``` 
sudo ./lemp.sh  
```


## Note:
 
   You can provide your own mysql root password by changing the default password "password" provided in this shell script lemp.sh-line no:177
 
``` 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your-password';
```

# This repo contains a SH script to setup a LEMP + Server { Linux + Nginx + MySQL + PHP FPM + JAVA + phpMyadmin} for development environment.


### Script Contains

1. Essentials
    * git-core
    * nano
    * make, gcc, auto-conf
1. Nginx
1. MySQL
1. phpMyadmin
1. JAVA
1. PHP
    * Phalcon PHP
    * php5-cli
    * php5-dev
    * php5-fpm
    * php5-mysql
    * php5-curl
    * php5-memcache
    * php5-gd
    * php5-mcrypt
    * php5-xmlrpc
    * php5-sqlite
   


## add new extension:

```
sudo apt install php {extension-name}
```

***
### Notes for PHP ###

1. **Default vhost created on VM at:** /etc/nginx/sites-available/php-vhost
2. **PHP INFO at:** http://{serverip}/info.php
3. **display_errors:** on;
4. **short_open_tags:** on;
5. **added extension:** 11;


### Notes for MySQL ###

1. **default root user:** root
2. **default root pass:** password


### Notes for JAVA ###

1. **default java version:** 11.0.15


