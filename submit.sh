#!/bin/bash

# Ask for task
read -p "Enter task to be submitted: " task

# Ask for user credentials
read -p "Enter your Computer Science CIP username: " username
read -s -p "Enter your Computer Science CIP password: " password
echo

# Set the name of the directory you want to transfer and the destination path for it
directory_name="/proj/i4spic/$USER/$task"
destination_path="/proj/i4spic/$username"

# Transfer the directory using SCP
sshpass -p "$password" scp -r $directory_name $username@cipterm0.cip.cs.fau.de:$destination_path
sshpass -p "$password" ssh -t $username@cipterm0.cip.cs.fau.de /proj/i4spic/bin/abgabe $task
