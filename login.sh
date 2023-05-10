#!/bin/bash

# Ask for user credentials
read -p "Enter your Computer Science CIP username: " username
read -s -p "Enter your Computer Science CIP password: " password
echo

# Save cs cip username
echo "CS_USER=$username" > ~/.spic_env

# Create ssh key and send it to cs server
ssh-keygen -q -t rsa -b 4096 -f ~/.ssh/id_rsa -N ''
sshpass -p "$password" ssh-copy-id -i ~/.ssh/id_rsa -o LogLevel=quiet -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $username@cipterm0.cip.cs.fau.de
echo
