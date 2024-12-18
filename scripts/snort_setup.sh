#!/bin/bash

# Function to display status messages
log_status() {
    echo -e "[INFO] $1"
}

# Update the system
log_status "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install Snort and its dependencies
log_status "Installing Snort and dependencies..."
sudo apt install -y snort tcpdump build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex

# Create directories for Snort rules and logs
log_status "Creating directories for Snort..."
sudo mkdir -p /etc/snort/rules /var/log/snort /usr/local/lib/snort_dynamicrules

# Configure HOME_NET in snort.conf
log_status "Configuring HOME_NET variable in snort.conf..."
sudo sed -i 's/var HOME_NET any/var HOME_NET 192.168.1.0\/24/' /etc/snort/snort.conf

# Ensure permissions
log_status "Adjusting permissions for directories..."
sudo chmod -R 755 /etc/snort /var/log/snort /usr/local/lib/snort_dynamicrules

# Add a default local rule file
log_status "Creating a default local.rules file..."
echo "# Custom Rules for Network IDS" | sudo tee /etc/snort/rules/local.rules > /dev/null

log_status "Snort setup completed successfully!"
