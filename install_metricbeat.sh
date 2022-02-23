#!/bin/bash
sudo apt update -y
sudo apt install metricbeat -y
sudo systemctl start metricbeat
sudo systemctl enable metricbeat
sudo metricbeat modules enable system
