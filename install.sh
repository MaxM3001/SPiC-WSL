#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y wget make udev gnupg apt-transport-https usbip hwdata usbutils sshpass
sudo /lib/systemd/systemd-udevd --daemon
wget -O - https://i4spic.cs.fau.de//editor/repo.gpg.key | sudo apt-key add -
echo "deb https://i4spic.cs.fau.de//editor/debian buster main" | sudo tee /etc/apt/sources.list.d/spic.list
sudo apt update
sudo apt install -y spic-editor
