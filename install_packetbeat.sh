#!/bin/bash
sudo apt install packetbeat -y
wget https://raw.githubusercontent.com/Jaibw/elk/main/packetbeat-template.yml
sed 's/USERNAME/luis/g' packetbeat-template.yml > packetbeat.yml
sudo cp /etc/packetbeat/packetbeat.yml /etc/packetbeat/packetbeat.yml.bak
sudo cp packetbeat.yml /etc/packetbeat/packetbeat.yml
sudo systemctl enable packetbeat
sudo systemctl restart packetbeat
sudo systemctl status packetbeat
