## Installation
  
To get Cockpit installed and running on your system, follow the instructions on the installation and running page.

After Cockpit is running, visit ip-address-of-machine:9090 in your web browser. If your browser is on the same machine where Cockpit is running, then visit localhost:9090 (for example).

### Running Cockpit

If you already have Cockpit on your server, point your web browser to: https://ip-address-of-machine:9090

## CentOS

Cockpit is available in CentOS 7 and later:

* **Step 1:** Install cockpit:

```
sudo yum install cockpit
```

* **Step 2:** Enable cockpit:

```
sudo systemctl enable --now cockpit.socket
```


* **Step 3:** Open the firewall if necessary:

```
sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload
```

## Ubuntu

Cockpit is available in Ubuntu 17.04 and later, and available as an official backport for 16.04 LTS and later.

* **Step 1:** This repository is enabled by default, but if you customized apt sources you might need to enable them manually.

```
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit
```

* **Step 2:** On Linux Mint, use UBUNTU_CODENAME instead of VERSION_CODENAME like so:

```
sudo apt install -t ${UBUNTU_CODENAME}-backports cockpit
```

## Note:
When updating Cockpit-related packages and any dependencies, make sure to use -t ...-backports as above, so backports are included.

* **Step 3:** Open the firewall if necessary:

```
sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload
```


## Creating Users

CentOS 7, CentOS Stream 8, and CentOS Stream 9

1. Log in as the root user on the desired server.

1. To create a new user, enter the following command:


```
adduser USERNAME
```

1. To set the password of the new user, enter the following command:

```
passwd USERNAME
```

## Ubuntu 18.04, Ubuntu 20.04, Ubuntu 22.04, Debian 10, and Debian 11

CentOS 7, CentOS Stream 8, and CentOS Stream 9

1. Log in as the root user on the desired server.

1. To create a new user, enter the following command:


```
adduser USERNAME
```

1. To set the password of the new user, enter the following command:

```
passwd USERNAME
```

1. Optional: Enter additional user information. To skip entering this information, press Enter.

```
Changing the user information for maxmustermann
Enter the new value, or press ENTER for the default
Full Name [ ]:
Room Number [ ]:
Work Phone [ ]:
Home Phone [ ]:
Other [ ]:
Is the information correct? [Y/n]
```

1. Type Y and press Enter.




## Assigning Sudo Rights to a User

CentOS 7, CentOS Stream 8, and CentOS Stream 9

1. To assign sudo privileges to a user in CentOS 7, CentOS Stream 8, and CentOS Stream 9, you must add the user to the wheel group. To add the user to this group, enter the following command:

```
usermod -aG wheel USERNAME
```

1. To check if the change was successful, enter the following command:

```
groups USERNAME
```

# Debian and Ubuntu

1. To assign sudo privileges to a user in Debian and Ubuntu, you must add the user to the sudo group. To add the user to this group, enter the following command:

```
usermod -aG sudo USERNAME
```

1. To check if the change was successful, enter the following command:

```
groups USERNAME
```