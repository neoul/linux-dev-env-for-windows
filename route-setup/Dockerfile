FROM justincormack/nsenter1
MAINTAINER neoul <neoul@ymail.com>

# docker run --rm -ti --privileged --network=none --pid=host justincormack/nsenter1 bin/sh
# iptables -A FORWARD -d 172.18.0.0/16 -j ACCEPT
# iptables -A FORWARD -s 172.18.0.0/16 -j ACCEPT
# iptables -L | grep 172.18.0.0

COPY start.sh /
CMD /start.sh
