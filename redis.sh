#!/bin/bash

# Check if the lock file exists. If it does, exit to avoid multiple instances.
LOCK_FILE="/tmp/ssh_tunnel.lock"
LOG_FILE="/var/log/ssh_tunnel.log"

if [ -e "$LOCK_FILE" ]; then
    echo "Another instance of the script is already running." | tee -a "$LOG_FILE"
    exit 1
fi

# Create the lock file to indicate that the script is running.
touch "$LOCK_FILE"

# Enable GatewayPorts yes in the /etc/ssh/sshd_config file on the target VPS
# Send the public key to the Target VPS

# SSH server IP address and port
SSH_HOST="IP_VPS_TARGET"
SSH_PORT=22

# Run the SSH command with port forwarding
ssh -N -L 6379:localhost:6379 -f -o ExitOnForwardFailure=yes -p $SSH_PORT -g root@$SSH_HOST

# Check if the SSH tunnel was successfully established
if [ $? -eq 0 ]; then
    echo "$(date): SSH tunnel successfully established." | tee -a "$LOG_FILE"
else
    echo "$(date): Failed to establish SSH tunnel. Retrying in 10 seconds..." | tee -a "$LOG_FILE"
    sleep 10
    exec "$0" "$@"  # Restart the script
fi

# Remove the lock file before exiting
rm -f "$LOCK_FILE"
