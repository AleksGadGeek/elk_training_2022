#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk -y
java -version
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee –a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt install elasticsearch -y
sudo cp /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.bak
sudo cat "network.host: localhost" > /etc/elasticsearch/elasticsearch.yml
sudo cat "http.port: 9200" >> /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch.service
sudo systemctl enable elasticsearch.service
