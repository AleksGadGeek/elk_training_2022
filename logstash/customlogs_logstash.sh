# CUSTOM LOGS WITH LOGSTASH 
cd ~
cd logstash-7.17.0
wget https://raw.githubusercontent.com/Jaibw/elk/main/logstash/samplelogs.txt
cat samplelogs.txt
wget https://raw.githubusercontent.com/Jaibw/elk/main/logstash/custom-logs.conf
sed 's/USERNAME/luis/g' custom-logs.conf > customlogs.conf
cat customlogs.conf
bin/logstash -f customlogs.conf
