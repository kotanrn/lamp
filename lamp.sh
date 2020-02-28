#! /bin/bash

### Set passwords to:
# root:lamp
# lamp:lamp



### Set ion as sudoer before you run this!
# sudo adduser lamp sudo



### Fully update the system first
sudo apt -y update; sudo apt -y upgrade; sudo apt -y dist-upgrade; sudo apt -y autoremove



### Install Vbox guest additions
sudo mount /dev/cdrom /media/cdrom
cd /media/cdrom
sudo apt-get install -y dkms build-essential linux-headers-$(uname -r)
./VBoxLinuxAdditions.run



### Install mariadb
sudo apt install -y mariadb-server mariadb-client
apt policy mariadb-server
systemctl status mariadb

# Set root password as lamp
sudo mysql_secure_installation



### Install apache2
sudo apt install -y apache2 apache2-utils

# Enable apache2 start during startup
sudo systemctl enable apache2



### Install php modules
sudo apt install -y php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath

# Enable php for apache2
sudo a2enmod php7.3 



### Create a php script to test LAMP stack installation.
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/phpinfo.php



### Show VM's ip address at login prompt
sudo echo " " >> /etc/issue
sudo echo " " >> /etc/issue
sudo echo "IP Address: \4 " >> /etc/issue




### Add some aliases
echo " " >> ~/.bashrc
echo " " >> ~/.bashrc
echo "### Custom aliases" >> ~/.bashrc
echo "alias aliases='clear; tail -n 10 ~/.bashrc'" >> ~/.bashrc
echo "alias reload='clear; source ~/.bashrc; sleep 2; aliases'" >> ~/.bashrc
echo "alias rc='clear; gedit ~/.bashrc'" >> ~/.bashrc
echo "alias off='sudo shutdown -h now'" >> ~/.bashrc
echo "alias me='clear; ip -4 -br a | grep -v -E lo'" >> ~/.bashrc



### http://192.168.1.249/phpinfo.php


### Access CLI interface for mariadb
mysql -u root -p
