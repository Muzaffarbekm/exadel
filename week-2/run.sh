#!/bin/bash
echo "Installing Nginx" zxc
NAME=devops2
apt update
apt install nginx
echo "Nginx is installed..."
echo "Running the Nginx"
systemctl start nginx
systemctl enable nginx
mkdir -p /var/www/$NAME/html
chown -R www-data:www-data /var/www/$NAME/html
chmod -R 755 /var/www/$NAME
echo "<h1>HELLO WORLD</h1>" > /var/www/$NAME/html/index.html
