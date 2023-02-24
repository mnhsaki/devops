## Secure Apache & Nginx with Let's Encrypt on CentOS 
## Prerequiste:
  
   * Cent OS.
  
   * Make sure you have already installed centos to continue. more at [centos.org](http://www.centos.org/)

   * Web Server 

## ✅ Setup Guide

### Step 1:
* To add the CentOS 7 & 8 EPEL repository, run the following command:

> Make sure you are the root user otherwise some resources wont be installed.
>
```
$ sudo su
```

```
sudo yum install epel-release
```

* Cloning the repository

```
$ git clone https://github.com/mnhsaki/devops.git
```

   * Download the script.

* Change directory

```
$ cd /letsencrypt/
```

   * change the file permission with 777 
  
```
sudo chmod 777 certbot.sh 
```

   * Run the script with sudo.  
  
``` 
sudo ./certbot.sh  
```


### Step 2 — Obtaining a Certificate

Now that Certbot is installed, you can use it to request an SSL certificate for your domain.

```
sudo certbot --apache -d example.com
```
or
```
sudo certbot --apache -d example.com -d www.example.com
```


### Step 3 — Checking your Certificate Status


At this point, you can ensure that Certbot created your SSL certificate correctly by using the [SSL Server Test](https://www.ssllabs.com/ssltest/) from the cloud security company [Qualys](https://www.qualys.com/).



### Step 4 — Setting Up Auto Renewal

Edit the crontab to create a new job that will run the renewal twice per day. To edit the crontab for the root user, run:

```
sudo crontab -e
```

Enter insert mode by pressing i and add in the following line:

```
#certbot
0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew
```

save and exit the file.

## Note:
 
* This will create a new cron job that will execute at noon and midnight every day. Adding an element of randomness to your cron jobs will ensure that hourly jobs do not all happen at the same minute, causing a server spike; python -c 'import random; import time; time.sleep(random.random() * 3600)' will select a random minute within the hour for your renewal tasks.
 
* Just check which server runinng befor access to the repository Nginx or Apache"

Nginx
```
sudo yum install certbot python2-certbot-nginx mod_ssl
```
Apache

```
sudo yum install certbot python2-certbot-apache mod_ssl
```

