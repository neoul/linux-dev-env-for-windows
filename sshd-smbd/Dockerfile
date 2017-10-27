FROM ubuntu:16.04 
MAINTAINER neoul <neoul@ymail.com>
# REF: https://docs.docker.com/engine/examples/running_ssh_service/

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y samba vim sudo

# add user
ARG USER
ARG UID
ARG PASSWD
ENV USER ${USER:-admin}
ENV UID ${UID:-1001}
ENV PASSWD ${PASSWD:-admin}

# VOLUME /home/$USER
RUN useradd --shell /bin/bash -u $UID -m $USER
RUN echo "$USER:$PASSWD" | chpasswd
RUN echo "$PASSWD\n$PASSWD\n" | smbpasswd -s -a $USER
RUN echo "$USER ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers
RUN unset PASSWD


# SSHD setup
#RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
#RUN echo 'root:admin' | chpasswd
#RUN echo "$USER:$PASSWD" | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# ssh port
EXPOSE 22

# SAMBA setup
#RUN apt-get install -y samba vim
RUN echo '[homes]' >> /etc/samba/smb.conf
RUN echo '   comment = Home Directories' >> /etc/samba/smb.conf
RUN echo '   browseable = no' >> /etc/samba/smb.conf
RUN echo '   read only = no' >> /etc/samba/smb.conf
RUN echo '   writeable = yes' >> /etc/samba/smb.conf
RUN echo '   create mask = 0700' >> /etc/samba/smb.conf
RUN echo '   directory mask = 0700' >> /etc/samba/smb.conf
RUN echo '   valid users = %S' >> /etc/samba/smb.conf
RUN echo '   path = %H' >> /etc/samba/smb.conf

EXPOSE 137 138 139 445

COPY start.sh /
CMD /start.sh
# RUN service smbd restart
# CMD ["/usr/sbin/sshd", "-D"]
