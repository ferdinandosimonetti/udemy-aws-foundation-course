#!/bin/bash
sudo yum -y install httpd
sudo chkconfig httpd on
sudo service httpd start
echo "<html><head><title>Udemy AWS Foundation course</title></head><body><h1>Deployed via Terraform</h1></body></html>" | sudo tee /var/www/html/index.html