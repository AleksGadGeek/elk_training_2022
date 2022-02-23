#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee –a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt install elasticsearch -y
wget https://raw.githubusercontent.com/Jaibw/elk/main/eslab-data.yml #file with cluster config
cat  eslab-data.yml
sed 's/NODENAME/AleksGadGeek/g' eslab-data.yml > elasticsearch.yml
cat elasticsearch.yml
sudo cp elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch.service
sudo systemctl enable elasticsearch.service
curl -X GET "localhost:9200"
