#!/bin/bash

TARGET="192.168.1.1"

# Generate ICMP traffic
echo "[INFO] Generating ICMP traffic..."
ping -c 4 $TARGET

# Simulate a port scan using Nmap
echo "[INFO] Simulating a port scan..."
nmap -p 22,80,443 $TARGET

# Simulate HTTP traffic on a non-standard port
echo "[INFO] Simulating HTTP traffic on port 8080..."
curl -I http://$TARGET:8080

# Simulate a file download
echo "[INFO] Simulating a file download..."
curl -O http://$TARGET/suspicious_file.bin
