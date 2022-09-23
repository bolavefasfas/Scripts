#!/bin/bash

echo "Updating and Upgrading machine"
sudo apt update -y 
sudo apt upgrade -y
sudo apt autoremove -y
echo "Installing Docker-Compose"
sudo apt install docker-compose -y
echo "Installing Rclone"
sudo -v ; curl https://rclone.org/install.sh | sudo bash

read -p "Do you want to proceed? (yes/no) " yn

case $yn in 
	yes ) echo "Installing Cloudflare" && curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

docker ps
docker images
