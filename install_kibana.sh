#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk -y
java -version
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee –a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt-get install kibana -y
wget https://raw.githubusercontent.com/Jaibw/elk/main/kibana.yml #Kibana config file
cat kibana.yml
sudo cp kibana.yml /etc/kibana/kibana.yml
sudo systemctl start kibana
sudo systemctl enable kibana
