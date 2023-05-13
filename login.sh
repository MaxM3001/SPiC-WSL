#!/bin/bash

# Ask for user credentials
read -p "Enter your Computer Science CIP username: " username
echo

# Save cs cip username
echo "CS_USER=$username" > ~/.spic_env

# Create ssh key and send it to cs server
ssh-keygen -q -t rsa -b 4096 -f ~/.ssh/id_rsa -N ''
ssh-copy-id -i ~/.ssh/id_rsa -o LogLevel=quiet -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $username@cipterm0.cip.cs.fau.de
echo
