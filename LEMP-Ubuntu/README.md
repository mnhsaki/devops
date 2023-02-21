# LEMP Installation, Nginix,Mysql and Php shell script for ubuntu OS's.

  
   **Automated installation script for LEMP current versions of Nginx, mysql and php for ubuntu OS's.**

   ### Setup Guide

* Make sure you have already installed Ubuntu to continue. more at [ubuntu.com](http://www.ubuntu.com/)

* **Step 1:** Cloning the repository

```
$ cd /usr/local/
$ git clone https://github.com/mnhsaki/devops.git
```

   * Download the script.

   * change the file permission with 777 
  
     ` ` ` sudo chmod 777 lemp.sh ` ` `

   * Run the script with sudo.  
  
     ` ` ` sudo ./lemp.sh  ` ` `

  
     
## Prerequiste:
  
   * Ubuntu OS.
  
## Note:
 
   You can provide your own mysql root password by changing the default password "password" provided in this shell script lemp.sh-line no:177
 
   ` ` ` ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your-password'; ` ` `



   This repo contains a SH script to setup a LEMP Server { Linux + Nginx + MySQL + PHP FPM } for Phalcon PHP development environment.



### Script Contains

1. Essentials
    * git-core
    * nano
    * make, gcc, auto-conf
1. Nginx
1. MySQL
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
   
***


### Setup Guide

* **Step 1:** Executing the Script

> Make sure you are the root user otherwise some resources wont be installed.
>
```
$ sudo su
```

### Notes for MySQL ###

1. **default root user:** root
2. **default root pass:** password




