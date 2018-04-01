#!/bin/bash
sudo apt-get install dmidecode 1>/dev/null
exec 1>./task4_1.out
echo '--- HARDWARE ---'
echo "CPU:"`dmidecode -t processor|grep Version|awk '{print $2 $3}'`
echo "RAM:"`dmidecode -t memory|grep Size:|awk '{print $2+$4 $3}'`
echo "Motherboard:"`dmidecode -t baseboard|grep Manufacturer` 
echo "System Serial Number:"`dmidecode -t baseboard|grep Serial|awk '{print $3}'`
echo '---System---'
echo "OS Distribution:"`cat /etc/*-release|grep Description`
echo "Kernel version"`uname -r`
echo "Installation date:"`uname -a|awk -F SMP '{print $1}'`
echo "Hostname:"`hostname -f`
echo "Uptime:"`uptime|awk '{print $3}'`
echo "Processes running:"`ps aux|wc -l`
echo "Users logged in:"`w|awk -F, '{print $2}'|grep '[1-9]'`
echo '---Network---'
ip addr |grep -i inet[^6]
