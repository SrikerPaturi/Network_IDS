# Network Intrusion Detection System (IDS) Project

## Overview
This project implements a Network Intrusion Detection System (IDS) using Snort on a Linux platform. The IDS monitors network traffic, detects suspicious activities, and provides actionable insights to improve network security. The implementation includes custom detection rules, automated alerts, and log management.

---

## Objectives

- **Real-Time Traffic Monitoring:** Capture and analyze network traffic for potential threats.
- **Threat Detection:** Identify unauthorized port scans, malicious payloads, and other suspicious activities.
- **Actionable Insights:** Generate alerts and logs for further analysis to improve the overall security posture.

---

## Tools and Platforms Used

- **Snort IDS:** Open-source intrusion detection and prevention system capable of packet sniffing, protocol analysis, and rule-based detection.
- **Linux Platform:** Chosen for its stability, security, and native compatibility with Snort and other network tools.
- **Wireshark:** Used to analyze network traffic and validate Snort alerts.
- **Nmap:** Generates test traffic to validate IDS functionality.

---

## Features

- **Packet Inspection:** Monitors real-time network traffic to detect anomalies.
- **Custom Rules:** Configurable rules to identify and respond to specific threats.
- **Automated Alerts:** Sends email notifications for suspicious activities detected by Snort.
- **Log Management:** Implements log rotation and compression to optimize storage.
- **Actionable Recommendations:** Provides detailed logs and alerts for security improvements.

---

## Project Outcomes

- Detected 3-4 threats, including unauthorized port scans, within a 30-day period.
- Successfully blocked 3 unauthorized port scans.
- Reduced response time to security incidents by 25% through automation and optimization.

---

## Repository Structure

```
Network_IDS_Project/
│
├── README.md
├── docs/
│   ├── IDS_Setup_Guide.md
│   ├── IDS_Troubleshooting.md
│
├── scripts/
│   ├── snort_setup.sh
│   ├── custom_rules.rules
│   ├── automate_alerts.sh
│   ├── test_traffic.sh
│
├── configs/
│   ├── snort.conf
│   ├── logrotate_snort.conf
│
└── logs/
    ├── example_alerts.log
    ├── rotated_logs/
```

---

## Installation Guide

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-repo/Network_IDS_Project.git
   cd Network_IDS_Project
   ```

2. **Run the Snort Setup Script:**
   ```bash
   sudo bash scripts/snort_setup.sh
   ```

3. **Configure Custom Detection Rules:**
   ```bash
   sudo nano scripts/custom_rules.rules
   ```

4. **Test the IDS:**
   ```bash
   sudo bash scripts/test_traffic.sh
   ```

5. **Enable Automated Alerts:**
   ```bash
   sudo bash scripts/automate_alerts.sh
   ```

---

## Usage

### Running Snort
To monitor traffic in real-time:
```bash
sudo snort -A console -q -c /etc/snort/snort.conf -i eth0
```

### Analyzing Logs
Logs are stored in the `logs/` directory. You can view them with:
```bash
cat /var/log/snort/alerts
```

### Automating Alerts
Use the alert automation script to send email notifications:
```bash
sudo bash scripts/automate_alerts.sh
```

---

## Documentation

- **IDS Setup Guide:** See `docs/IDS_Setup_Guide.md` for a detailed step-by-step installation and configuration guide.
- **Troubleshooting:** Refer to `docs/IDS_Troubleshooting.md` for resolving common issues during deployment or operation.

---

## Troubleshooting Tips

1. **Configuration Errors:**
   - Verify Snort configuration using:
     ```bash
     sudo snort -T -c /etc/snort/snort.conf
     ```
   - Ensure `HOME_NET` is correctly defined in the `snort.conf` file.

2. **Performance Issues:**
   - Use packet capture filters to limit traffic:
     ```bash
     sudo snort -c /etc/snort/snort.conf -i eth0 'port 80'
     ```
   - Optimize rules to avoid unnecessary processing.

---

## Contributing
Contributions are welcome! Fork the repository, create a branch, and submit a pull request for review.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
