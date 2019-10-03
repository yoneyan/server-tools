#!/bin/bash

echo 'This script is Server Network Tool assistance.'
echo 'Warning:Currently supports CentOS only'
echo '0: init   1: create   2: delete   3:restart'
read choose
echo 'selected ' $choose


if [ $choose -eq 0 ]; then
	systemctl stop NetworkManager
	systemctl disable NetworkManager
	modprobe bonding
if [ $choose -eq 1 ]; then
	echo '1: LAG   3:VLAN(Currently Not Support)'
if [ $choose -eq 2 ]; then
	
if [ $choose -eq 3 ]; then
	SYSTEMCTL_SKIP_REDIRECT="enable" bash -x /etc/init.d/network restart
fi
