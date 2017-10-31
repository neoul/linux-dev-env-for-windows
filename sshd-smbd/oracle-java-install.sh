#!/usr/bin/expect -f

set timeout 60
spawn apt-get install -y oracle-java8-installer maven
while {1} {
	expect {
	eof {exit 0}
	"Do you accept the Oracle Binary Code license terms?" {send "yes\r"}
	}
}
expect eof
