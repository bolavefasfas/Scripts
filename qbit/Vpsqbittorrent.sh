#!/bin/bash
while getopts ":u:p:o:r:c:" opt; do
  case "$opt" in
    u) WEBUSER=$OPTARG ;;
    p) WEBPASSWORD=$OPTARG ;;
    o) PORT=$OPTARG ;;
    r) remote=$OPTARG ;;
    c) RCLONE_CONFIG_IN_RAW_URL=$OPTARG ;;
  esac
done

echo $WEBUSER
echo $port
echo $rconf
echo $WEBPASSWORD
echo $RCLONE_CONFIG_IN_RAW_URL
echo $remote
apt update
apt install unzip -y
apt install curl -y
apt install wget -y
apt install qbittorrent-nox -y
curl -L 'rclone.org/install.sh' |bash
cd /
wget 'https://raw.githubusercontent.com/bolavefasfas/Scripts/main/qbit/qBconf.tar.gz'
tar -xf qBconf.tar.gz; rm qBconf.tar.gz
echo "Scripted By Earth"
echo "Orgin repository : https://github.com/bolavefasfas/Scripts/tree/main/qbit"
mkdir /.config
mkdir /.config/rclone
curl -L $RCLONE_CONFIG_IN_RAW_URL >/.config/rclone/rclone.conf
curl -L $RCLONE_CONFIG_IN_RAW_URL >$(rclone config file |sed 's/ /\n/g'|grep rclone.conf |head -1)

echo $PORT >/PORT
#curl -L $QBITTORRENT_CONFIG_IN_RAW_URL
cat /qBittorrent/config/qBittorrent.conf >/qBittorrent/qBittorrent.conf
echo -n "$WEBPASSWORD" |md5sum |sed 's|  -||g' >/qBittorrent/WEBHASHPASSWORD
cat /qBittorrent/qBittorrent.conf |sed "s|devanaz:|$remote:|g" |sed "s|developeranaz|$WEBUSER|g" |sed "s|bc89e64478e74b30bea280349e1220ce|$(cat /qBittorrent/WEBHASHPASSWORD)|g" >/qBittorrent/config/qBittorrent.conf
curl -L "https://raw.githubusercontent.com/bolavefasfas/Scripts/main/qbit/qbit" >/usr/bin/qbit
chmod +x /usr/bin/qbit
echo "qbittorrent-to-rclone installed /usr/bin/qbit"
echo "start qbittorrent server by typing 'qbit -p 8088'"
echo "qbittorrent auto starting.."
/usr/bin/qbit -p 8099
