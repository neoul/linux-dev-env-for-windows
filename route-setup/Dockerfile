FROM justincormack/nsenter1
MAINTAINER neoul <neoul@ymail.com>

# docker run --rm -ti --privileged --network=none --pid=host justincormack/nsenter1 bin/sh
# iptables -A FORWARD -d 10.10.0.0/16 -j ACCEPT
# iptables -A FORWARD -s 10.10.0.0/16 -j ACCEPT
# iptables -L | grep 10.10.0.0
ARG MYSUBNET_AND_MASK
ENV MYSUBNET_AND_MASK ${MYSUBNET_AND_MASK:-10.10.0.0/16}

CMD /bin/sh -c "iptables -A FORWARD -d $MYSUBNET_AND_MASK -j ACCEPT && iptables -A FORWARD -s $MYSUBNET_AND_MASK -j ACCEPT && watch -n 60 iptables -L"