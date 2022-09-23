#!/bin/bash

echo "Updating and Upgrading machine"
sudo apt update -y 
sudo apt upgrade -y
sudo apt autoremove -y
echo "Installing Docker-Compose"
sudo apt install docker-compose -y
echo "Installing Rclone"
sudo -v ; curl https://rclone.org/install.sh | sudo bash

while true; do

read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	[yY] ) echo "Installing Cloudflare" && curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb;
		break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac

done


docker ps
docker images
