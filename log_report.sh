report_file="/home/log_report/log_report.txt"
report_log="/home/log_report/report.log"
echo "Reporting....." >> "$report_log"

header(){
	echo "------$1------[$(date '+%Y-%m-%d %H:%M:%S')]------" >> "$report_file"
}

system_log(){
	if [ -e "/var/log/syslog" ]; then
	journalctl -n 20 >> "$report_file"
	else
	echo "System log not found"
fi
}

auth_log(){
	if [ -e "/var/log/auth.log" ]; then
	journalctl | grep -i "failed login" >> "$report_file"
	else
	echo "Authentication log not found"
fi
}

count_warning(){
	if [ -e "/var/log/syslog" ]; then
	journalctl | grep -i "warning"  | wc -l >> "$report_file"
	else
	echo "Warning count not found"
fi
}

kernel_log(){
	if [ -e "/var/log/kern.log" ]; then
	tail -n 10 "/var/log/kern.log" >> "$report_file"
	else
	echo "Kernel log not found"
fi
}

> "$report_file"

header "SYSTEM LOG SUMMARY"
system_log
echo " " >> "$report_file"
header "LATEST AUTHENTICATION FAILURE"
auth_log
echo " " >> "$report_file"
header "NUMBER OF WARNINGS IN SYSTEM LOG"
count_warning
echo " " >> "$report_file"
header "LAST FEW LINES OF KERNEL"
kernel_log
echo " " >> "$report_file"

echo "Log report generated:" >> "$report_file"
echo "Log report generated:" >> "$report_log"
