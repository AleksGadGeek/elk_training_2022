#!/bin/bash
curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-8.0.0-x86_64.rpm
sudo rpm -vi heartbeat-8.0.0-x86_64.rpm
sudo yum install heartbeat-elastic -y
wget https://raw.githubusercontent.com/Jaibw/elk/main/heartbeat-template.yml
wget https://raw.githubusercontent.com/Jaibw/elk/main/icmp.yml
sed 's/USERNAME/luis/g' heartbeat-template.yml > heartbeat.yml
cp /etc/heartbeat/heartbeat.yml /etc/heartbeat/heartbeat.yml.bak
cp heartbeat.yml /etc/heartbeat/heartbeat.yml
cp icmp.yml /etc/heartbeat/monitors.d/icmp.yml
systemctl enable heartbeat-elastic
#chkconfig --add heartbeat-elastic
systemctl start heartbeat-elastic
systemctl status heartbeat-elastic
