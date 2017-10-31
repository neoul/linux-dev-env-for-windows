#!/usr/bin/expect -f

set timeout 60
spawn apt-get install -y xorg
while {1} {
	expect {
	eof {exit 0}
	"Country of origin for the keyboard:" {send "54\r"}
	"Keyboard layout:" {send "2\r"}
	}
}
expect eof
