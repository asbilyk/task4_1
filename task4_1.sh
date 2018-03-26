#!/bin/bash
yum install dmidecode
exec 1>./task4_1.out
echo '--- HARDWARE ---'
echo "CPU: dmidecode --type processor"
echo "RAM: dmidecode -t memory | grep -i size"
echo "Motherboard:' dmidecode --type baseboard-manufacturer" 
echo "System Serial Number: dmidecode -s system-serial-number"
echo '---System---'
