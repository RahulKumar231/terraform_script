#!/bin/bash
yum update -y
yum install httpd* -y
systemctl start httpd
systemctl enable httpd
echo "Shre Radha Rani Radha Radha Krishna" > /var/www/html/index.html

