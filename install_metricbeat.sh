#!/bin/bash
sudo apt update -y
sudo apt install metricbeat -y
sudo metricbeat modules enable nginx
wget https://raw.githubusercontent.com/Jaibw/elk/main/metricbeat-template.yml
sed 's/USERNAME/luis/g' metricbeat-template.yml > metricbeat.yml
sudo cp /etc/metricbeat/metricbeat.yml /etc/metricbeat/metricbeat.yml.bak
sudo cp metricbeat.yml /etc/metricbeat/metricbeat.yml

#https://raw.githubusercontent.com/darkneszalex/elk_training_2022/main/install_metricbeat.sh
