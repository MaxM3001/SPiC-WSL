#!/bin/bash

# Ask for task
read -p "Enter task of which the deadline should be shown: " task
echo

# Load variable for cip username
export $(grep -v '^#' ~/.spic_env| xargs)

# Run the script on remote server using ssh
ssh -o LogLevel=quiet -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -t $CS_USER@cipterm0.cip.cs.fau.de /proj/i4spic/bin/get-deadline $task
echo
