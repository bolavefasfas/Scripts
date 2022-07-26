#!/bin/bash	
# Cosmos Ubuntu desktop minimal installation Bash Script
sudo apt update -y
sudo apt install tasksel -y
tasksel --list-tasks
sudo tasksel install ubuntu-desktop-minimal
reboot
