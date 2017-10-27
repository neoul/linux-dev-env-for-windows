FROM ubuntu:14.04
MAINTAINER neoul@ymail.com

RUN apt-get update
RUN apt-get install -y tftpd-hpa
VOLUME /var/lib/tftpboot

EXPOSE 69

# Uncomment the following CMD for tftp push (write)
#CMD chmod 777 /var/lib/tftpboot && /usr/sbin/in.tftpd --foreground --address 0.0.0.0:69 -c -v --secure /var/lib/tftpboot
CMD chmod 775 /var/lib/tftpboot && /usr/sbin/in.tftpd --foreground --address 0.0.0.0:69 -c -v --secure /var/lib/tftpboot
