#!/bin/bash
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.17.0-linux-x86_64.tar.gz
tar -xfz logstash-7.17.0-linux-x86_64.tar.gz
cd logstash-7.17.0/
wget https://raw.githubusercontent.com/Jaibw/elk/main/logstash/hello-world.conf
bin/logstash -f hello-world.conf  
