#!/bin/bash
#curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-8.0.0-x86_64.rpm
#sudo rpm -vi heartbeat-8.0.0-x86_64.rpm
yum -y install java-11-openjdk java-11-openjdk-devel -y
cat > /etc/yum.repos.d/elasticsearch.repo <<EOF
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
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
