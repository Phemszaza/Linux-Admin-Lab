Day 1 – Linux SysAdmin Practice

🖥️ Environment Setup

Host Machine: Windows (VirtualBox)

Guest VM: Ubuntu Server 22.04 LTS

Resources: 2 vCPU, 4 GB RAM, 20 GB Disk

Users: Created a non-root user with sudo privileges

Networking:
enp0s3 → NAT (internet access via DHCP)

enp0s8 → Host-only (static IP 192.168.56.100 for SSH, Cockpit, XRDP)

📂 Linux Basics Practiced
File & directory management:
ls, cd, pwd, cp, mv, rm

System information:
id, uname -a, uptime, df -h, free -h

Networking commands:
ip addr, ping -c 4 8.8.8.8

📜 First Automation Script – sysinfo.sh
Created a simple system info script:

#!/bin/bash
echo "System Information for: $(hostname)"
echo "----------------------------------"
echo "Uptime: $(uptime -p)"
echo
echo "Disk usage:"
df -h | grep -E '^Filesystem|/dev/'
echo
echo "Memory usage:"
free -h


How to run:
chmod +x sysinfo.sh
./sysinfo.sh


Sample output:

System Information for: ubuntu-vm
----------------------------------
Uptime: up 1 hour, 12 minutes

Disk usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  2.5G   17G  13% /

Memory usage:
              total        used        free      shared  buff/cache   available
Mem:           3.9G        512M        2.8G        9.0M        600M        3.2G

🌐 Cockpit Web Console

Installed Cockpit:

sudo apt update
sudo apt install cockpit -y
sudo systemctl enable --now cockpit.socket


Accessed from Windows browser:

https://192.168.56.100:9090


Logged in with Ubuntu server user credentials.

Features explored: System overview, logs, networking, storage, and web terminal.

⚠️ Note: No firewall (ufw) enabled yet, so port 9090 was accessible by default.

🖥️ XRDP – Remote Desktop Access

Installed XRDP service:

sudo apt install xrdp -y
sudo systemctl enable --now xrdp


Connected from Windows using Remote Desktop Connection (mstsc.exe):

Server: 192.168.56.100

Protocol: RDP

Logged in with Ubuntu user credentials.

🖼️ LXDE Desktop Environment

Installed lightweight LXDE GUI:

sudo apt install lxde -y


Verified XRDP launches into LXDE desktop environment.

Benefits:

Light on resources (perfect for VMs).

Simple, familiar interface for users/admins.

Works smoothly with XRDP out of the box.

📝 Key Learnings from Day 1

How to configure static IPs with Netplan for reliable connectivity.

Running essential Linux commands to navigate and manage the system.

Writing a basic Bash script for system monitoring.

Accessing the server through:

CLI → SSH from Windows PowerShell

Web → Cockpit on port 9090

GUI → XRDP with LXDE

Importance of planning network interfaces (NAT vs Host-Only).

📸 Screenshots (in day1/screenshots/)

Sysinfo script output

Cockpit dashboard

XRDP LXDE desktop session
