#!/bin/bash
sudo apt install logstash -y
wget https://raw.githubusercontent.com/Jaibw/elk/main/easy-logstash-template.yml
sed 's/USERNAME/yourname/g' easy-logstash-template.yml > logstash.yml
sudo cp /etc/logstash/logstash.yml /etc/logstash/logstash.yml.bak
sudo cp logstash.yml /etc/logstash/logstash.yml
wget https://raw.githubusercontent.com/Jaibw/elk/main/logstash-filebeat-template.yml
sudo cp logstash-filebeat-template.yml /etc/filebeat/filebeat.yml
systemctl restart filebeat
systemctl start logstash
