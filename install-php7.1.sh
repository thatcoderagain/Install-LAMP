echo -e "\nUpdaing  repo index"
sudo apt update
sudo apt install software-properties-common

echo -e "\nInstalling Apache"
sudo apt install apache2

echo -e "\nInstalling PHP v7.1"
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.1 php7.1-common php7.1-opcache php7.1-mcrypt php7.1-cli php7.1-gd php7.1-curl php7.1-mysql php7.1-mbstring php7.1-gettext php7.1-soap

echo -e "\nUpdaing PHP Configuration"
sudo apt install php7.1-fpm
sudo systemctl restart php7.1-fpm.service

echo -e "\nInstalling MySQL"
sudo apt install mysql-server
sudo mysql_secure_installation

echo -e "\nInstalling PhpMyAdmin"
echo -e "\n\nWarning: When the prompt appears, 'apache2' is highlighted, but not selected. If you do not hit SPACE to select Apache, the installer will not move the necessary files during installation. Hit SPACE, TAB, and then ENTER to select Apache."
echo "\n\nPress any key to continue"
read enter

sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt update
sudo apt install phpmyadmin
sudo phpenmod mbstring

echo -e "\nRestarting Apache"
sudo systemctl restart apache2
echo -e "\nRestarting MySQL"
sudo systemctl mysql apache2

