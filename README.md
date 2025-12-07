# **📄 Automated Log Reporting Script (log_report.sh)**

A simple but powerful Linux automation tool that collects important system logs and generates a consolidated, easy-to-read report every 6 hours.  

This project showcases practical Cloud/DevOps/SRE skills, including log analysis, shell scripting, automation, and cron-based scheduling.  

**🚀 Project Overview**

logreport.sh is a Bash script that gathers different types of system logs:  
1. System logs (/var/log/syslog)  
2. Authentication logs (failed login attempts)  
3. Kernel logs (/var/log/kern.log)  
4. Warning messages (counted via journalctl)  
5. It then formats them with headers and timestamps and saves everything into a consolidated file:  
log_report.txt  
6. A cron job schedules this script to run every 6 hours, automatically generating updated reports.  

This tool is useful for: 
1. System administrators  
2. Cloud engineers  
3. DevOps engineers  
4. Anyone who wants quick access to system activity

🛠️ Features  
✔ Automatically collects:  
  Latest 20 system log entries  
  Latest failed authentication attempts  
  Total warning count  
  Last 10 kernel log entries  

✔ Formats each section with:  
  Clear headers  
  Timestamps  
  Organized output  

✔ Stores results in:  
  /home/<user>/cloud/practice/log_report/log_report.txt

✔ Runs automatically every 6 hours using cron  

📦 Project Structure  
log_report/  
│  
├── logreport.sh        # Main script  
├── log_report.txt      # Generated report  
└── report.log          # Script execution history  

📜 How It Works  
1️⃣ The script uses tools like:  
  journalctl  
  grep  
  tail  
  wc  
  to extract logs from the system.  

2️⃣ Each section is wrapped in a timestamped header:  
------SYSTEM LOG SUMMARY------[2025-12-07 11:53:06]------  

3️⃣ The final output includes:  
  System activity  
  Failed logins  
  Warning count  
  Kernel messages  
  All in one place for easy access.  

⚙️ Cron Job Scheduling  
  To automate the script, add this entry to your crontab: 

  0 */6 * * * /usr/bin/bash /home/<user>/cloud/practice/log_report/logreport.sh  

This runs the script at:  
  00:00  
  06:00  
  12:00  
  18:00  

  every day, month, and year.  

📬 Contact

Feel free to reach out if you'd like help or want to collaborate on DevOps and Cloud projects.  

[![LinkedIn](linkedin.com/in/safi-ahmed-shariff-b03499264)  
[![Email](safiahmedshariff@gmail.com)
