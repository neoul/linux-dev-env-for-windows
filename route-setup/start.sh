#!/bin/sh

iptables -A FORWARD -d $MYSUBNET -j ACCEPT
iptables -A FORWARD -s $MYSUBNET -j ACCEPT
iptables -L | grep $MYSUBNET