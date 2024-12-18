
---

### **`docs/IDS_Troubleshooting.md`**

```markdown
# IDS Troubleshooting Guide for Snort-based Network Intrusion Detection System (IDS)

## Introduction

This guide provides solutions to common issues encountered during the installation, configuration, and operation of Snort-based IDS systems. Whether you're facing configuration errors, performance issues, or challenges with alerts, this guide offers practical solutions to ensure the system functions optimally.

---

## Common Issues and Solutions

### 1. **Snort Configuration Errors**

#### Error: **"Snort failed to start with error: Invalid HOME_NET configuration"**

- **Cause:** The `HOME_NET` variable is not properly configured in the `snort.conf` file.
- **Solution:**
  1. Open the `snort.conf` file:
     ```bash
     sudo nano /etc/snort/snort.conf
     ```
  2. Ensure that `HOME_NET` is correctly defined, e.g.:
     ```bash
     var HOME_NET 192.168.1.0/24
     ```
  3. Verify that the `EXTERNAL_NET` variable is not set to `any` if you want to monitor specific traffic.

#### Error: **"Snort: No rules files found"**

- **Cause:** Snort cannot find the rules files due to misconfiguration.
- **Solution:**
  1. Ensure that the `$RULE_PATH` variable in `snort.conf` points to the correct directory where rules are stored. For example:
     ```bash
     var RULE_PATH /etc/snort/rules
     ```
  2. Verify that the `local.rules` file is present in the specified directory.

---

### 2. **Performance Issues**

#### Issue: **High CPU Usage During Traffic Capture**

- **Cause:** Snort may be processing too many irrelevant packets or handling excessive traffic without appropriate filtering.
- **Solution:**
  1. **Use Packet Capture Filters:** Limit traffic to relevant data, such as HTTP traffic on port 80:
     ```bash
     sudo snort -c /etc/snort/snort.conf -i eth0 'port 80'
     ```
  2. **Optimize Snort Rules:** Review and optimize rules to avoid unnecessary processing. Remove or comment out rules that are not critical to your environment.

#### Issue: **Snort Drops Packets**

- **Cause:** Snort might be overloaded with traffic, causing packet drops.
- **Solution:**
  1. **Increase the Snort Buffer Size:** Edit the `snort.conf` file and increase the buffer size to handle more traffic:
     ```bash
     var SNAPLEN 1514
     ```
  2. **Implement Load Balancing:** If your network traffic volume is high, consider distributing traffic across multiple Snort instances.

---

### 3. **Alerting Issues**

#### Issue: **No Alerts Triggered**

- **Cause:** Custom rules may not be applied, or Snort is not properly detecting traffic.
- **Solution:**
  1. **Verify Rule Activation:** Ensure that the `local.rules` file is included in the configuration:
     ```bash
     include $RULE_PATH/local.rules
     ```
  2. **Manually Trigger Alerts:** Simulate traffic to check if alerts are being generated:
     ```bash
     sudo bash scripts/test_traffic.sh
     ```

#### Issue: **Alerts Not Sent via Email**

- **Cause:** The email alert system may not be set up properly in `automate_alerts.sh`.
- **Solution:**
  1. Ensure that the script has the correct email configuration:
     ```bash
     EMAIL="your-email@example.com"
     ```
  2. Confirm that `mail` is installed on your system:
     ```bash
     sudo apt install mailutils
     ```

---

## Conclusion

By following these troubleshooting steps, you should be able to resolve the most common issues with Snort-based IDS. Regular maintenance, rule updates, and log analysis are essential for ensuring your system remains effective in detecting and responding to security threats.
