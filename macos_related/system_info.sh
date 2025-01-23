#!/bin/bash
echo "The script was executed at:" $(date '+%d-%m-%Y %H:%M:%S')
echo "Script to check macbook pro basic information.."
hostname=$(hostname)
os_name=$(uname -s)
kernel_version=$(uname -r)
architecture=$(uname -m)
total_avail_disk_space=$(echo ; df -h | awk '{print $1, $4}')
total_used_disk_space=$(echo; df -h | awk '{print $3}')
total_memory=$(/usr/sbin/system_profiler SPHardwareDataType)
cpu_cores=$(sysctl -n hw.ncpu; echo; )

# Print system information
echo "The laptop hostname: $hostname"
echo "The laptop operating System: $os_name"
echo "The laptop kernel Version: $kernel_version"
echo "The laptop architecture: $architecture"
echo "The laptop total avail disk space: $total_avail_disk_space"
echo "The laptop total used disk space: $total_used_disk_space"
echo "The laptop total available memory: $total_memory"
echo "The laptop total available cpu cores: $cpu_cores"
exit 0
