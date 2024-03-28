#!/bin/bash

# Update and upgrade system
sudo apt update
sudo apt upgrade -y
sudo apt install -y sudo curl wget unzip busybox nano
sudo apt autoremove -y

# Install rclone
curl https://rclone.org/install.sh | sudo bash

# Install iyear.me/tdl
curl -sSL https://docs.iyear.me/tdl/install.sh | sudo bash
