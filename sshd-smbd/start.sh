#!/bin/bash

service smbd restart
# service sshd restart
# /bin/bash
/usr/sbin/sshd -D
