#!/bin/bash

LOG_FILE="/var/log/snort/alerts"
EMAIL="admin@example.com"

# Function to send email alerts
send_alert() {
    local alert_message=$1
    echo "$alert_message" | mail -s "Snort Alert" $EMAIL
}

# Monitor alerts and log them with timestamps
echo "[INFO] Monitoring Snort alerts from $LOG_FILE..."
tail -F $LOG_FILE | while read LINE; do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP: $LINE" >> /var/log/snort/alert_log.txt

    # Send email notification for high-priority alerts
    if [[ "$LINE" == *"Unauthorized SSH attempt"* || "$LINE" == *"Nmap Scan Detected"* ]]; then
        send_alert "High-priority alert detected: $LINE"
    fi
done
