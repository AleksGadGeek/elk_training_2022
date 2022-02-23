#!/bin/bash
sudo apt update
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee –a /etc/apt/sources.list.d/
elastic-7.x.list
sudo apt update -y
sudo apt install filebeat -y
sudo apt install nginx -y
sudo systemctl start nginx 
sudo systemctl enable nginx
