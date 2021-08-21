#!/bin/bash

# First uninstoall any unnecessary packages.
apt-get update
apt install sudo -y
#PASS=$(date +%s | sha256sum | base64 | head -c 12 ; echo)
#echo fuser $PASS > /tmp/pass.txt
#adduser fuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
#echo "proxyuser:$PASS" | sudo chpasswd

#echo "proxyuser  ALL=(ALL:ALL) ALL" >> /etc/sudoers

apt-get -y install nano php-fpm
apt-get -y install lsb-release

echo ""
echo "Configuring /etc/apt/sources.list."
sleep 5
./setup.sh apt

echo ""
echo "Installing updates & configuring SSHD / hostname."
sleep 5
#./setup.sh basic

echo ""
echo "Installing LAMP or LNMP stack."
sleep 5
./setup.sh install

echo ""
echo "Optimizing AWStats, PHP, logrotate & webserver config."
sleep 5
./setup.sh optimize

## Uncomment to secure /tmp folder
#echo ""
#echo "Securing /tmp directory."
## Use tmpdd here if your server has under 256MB memory. Tmpdd will consume a 1GB disk space for /tmp
#./setup.sh tmpfs

echo ""
echo "Installation complete!"
echo "New user fuser $PASS"
