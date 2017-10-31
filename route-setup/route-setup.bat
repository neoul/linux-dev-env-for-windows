SET MYSUBNET=10.10.0.0
route /P add %MYSUBNET% mask 255.255.0.0 10.0.75.2

:: route add %MYSUBNET% mask 255.255.0.0 10.0.75.2
:: docker run --rm -ti --privileged --network=none --pid=host justincormack/nsenter1 bin/sh -c "echo 'iptables -A FORWARD -d %MYSUBNET%/16 -j ACCEPT' > /update.sh"
:: docker run --rm -ti --privileged --network=none --pid=host justincormack/nsenter1 bin/sh -c "echo 'iptables -A FORWARD -s %MYSUBNET%/16 -j ACCEPT' >> /update.sh"
:: docker run --rm -ti --privileged --network=none --pid=host justincormack/nsenter1 bin/sh -c "chmod 744 /update.sh && ./update.sh"
