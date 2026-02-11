#!/bin/bash

# Update the system packages
yum update -y

# Install Apache web server, PHP, and MySQL connector for PHP
yum install -y httpd php php-mysqlnd

# Start and enable Apache web server
systemctl start httpd
systemctl enable httpd

# Create web root directory for WordPress (adding 'blog' subdirectory)
mkdir -p /var/www/html/blog

# Change to the web root directory
cd /var/www/html/blog

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .

# Clean up downloaded and extracted files
rm -rf wordpress latest.tar.gz

# Set proper ownership and permissions
chown -R apache:apache /var/www/html/blog
chmod -R 755 /var/www/html/blog

# Create WordPress config file
cd /var/www/html/blog
cp wp-config-sample.php wp-config.php

# Replace database connection details in wp-config.php
sed -i "s/database_name_here/${db_name}/" wp-config.php
sed -i "s/username_here/${db_username}/" wp-config.php
sed -i "s/password_here/${db_password}/" wp-config.php
sed -i "s/localhost/${rds_endpoint}/" wp-config.php