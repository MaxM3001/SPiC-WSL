#!/bin/bash

# Ask for task
read -p "Enter task to be submitted: " task
echo

# Load variable for cip username
export $(grep -v '^#' ~/.spic_env| xargs)

# Set the source directory and the destination path
directory_name="/proj/i4spic/$USER/$task"
destination_path="/proj/i4spic/$CS_USER"

# Transfer the directory using SCP
scp -o LogLevel=quiet -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r $directory_name $CS_USER@cipterm0.cip.cs.fau.de:$destination_path
echo

# Run the script on remote server using ssh
ssh -o LogLevel=quiet -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -t $CS_USER@cipterm0.cip.cs.fau.de /proj/i4spic/bin/abgabe $task
echo
