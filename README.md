# Linux development environment using docker on windows

## Prerequisite

- windows 10
- Install docker for windows
- Install git for windows
- Install vcxsrv for x window over windows

## Update your development environment

### 1. Edit .env file to setup your internal LAN domain.

``` shell
USER=neoul # Your linux account ID
UID=1000 # Your linux account UID
PASSWD=admin # Your linux account password
HOSTIP=192.168.0.78 # Your Host IP (Windows IP)
MYSUBNET_AND_MASK=10.10.0.0/16 # Your development subnet
MYMACHINE=10.10.0.2 # Your linux machine IP
```

### 2. Edit %MYSUBNET% in `route-setup/route-setup.bat` file

``` dos
SET MYSUBNET=10.10.0.0
route add %MYSUBNET% mask 255.255.0.0 10.0.75.2
```

## Setup IP route of your internal domain using `route-setup/route-setup.bat`

> You needs admin permission for your windows.

``` dos
./route-setup/route-setup.bat
```

## Build your linux-dev-env containers

``` shell
# on top of the directory
docker-compose build
```

## Run your linux-dev-env containers

Make sure your published ip address and ports are available before starting.
For example, 
- tftp requires udp 69 port for running.
- ftp requires tcp 20, 21 and 65500-65515 ports for running.
- They should NOT be allocated to other processes or docker containers.

```shell
docker-compose up -d
```

If you don't want tftp and ftp services, comment out them from `docker-compose.yml`.

``` shell
#  ftp:
#    build:
#      context: ./vsftpd-anon
#      dockerfile: Dockerfile
#    restart: always
#    environment:
#      - HOSTIPADDR=$HOSTIP
#    volumes:
#      - files:/var/ftp:ro
#    ports:
#      - "$HOSTIP:20-21:20-21"
#      - "$HOSTIP:65500-65515:65500-65515"
#
#  tftp:
#    build:
#      context: ./tftpd-hpa
#      dockerfile: Dockerfile
#    restart: always
#    volumes:
#      - files:/var/lib/tftpboot
#    ports:
#      - "$HOSTIP:69:69/udp"
```

## Access your local linux machine

- via ssh
- via samba file sharing

``` shell
# ssh
ssh 10.10.0.2

# remote file system
\\10.10.0.2\neoul
```

## Stop linux-dev-env containers

You can stop your containers using the following command.

```shell
docker-compose stop
```

## Remove your containers.

You can remove your container using the following command.

```shell
docker-compose down
```

## Install your development tools

You have to add your installation instructions into `sshd-smbd/Dockerfile` or `sshd-smbd/Dockerfile.gui`

``` Dockerfile
...
RUN apt-get install -y zip unzip bzip2 libdigest-sha-perl
...
```

## Troubleshooting

onos-buck run onos-local에서 실행되지 않던 onos instance가 onos-run을 수행하자 실행되었음.
또는 onos cell로 remote에 onos instance를 push하면 동작하였음...
그러나 onos-buck run onos-local은 동작하지 않음.

```
sdn@b3f9552bc9ad:~/onos$ find . -name "*onos-run*"
./buck-out/bin/tools/package/.onos-run
./buck-out/gen/tools/package/onos-run__srcs
./buck-out/gen/tools/package/onos-run__srcs/onos-run-karaf
./buck-out/gen/tools/package/onos-run__tmp
./buck-out/gen/tools/package/onos-run
./buck-out/gen/tools/package/onos-run/onos-run
./tools/package/onos-run-karaf
sdn@b3f9552bc9ad:~/onos$ vi buck-out/bin/tools/package/.onos-run/
sdn@b3f9552bc9ad:~/onos$ vi buck-out/gen/tools/package/onos-run
sdn@b3f9552bc9ad:~/onos$ ./buck-out/gen/tools/package/onos-run
-bash: ./buck-out/gen/tools/package/onos-run: Is a directory
sdn@b3f9552bc9ad:~/onos$ ./buck-out/gen/tools/package/onos-run
onos-run/       onos-run__srcs/ onos-run__tmp/  
sdn@b3f9552bc9ad:~/onos$ ./buck-out/gen/tools/package/onos-run/onos-run 
Running clean installation...
Host [localhost]:8101 not found in /home/sdn/.ssh/known_hosts
Creating local cluster configs for IP 127.0.0.1...
Waiting for karaf.log
Nov 01, 2017 12:09:32 PM org.apache.karaf.main.Main launch
INFO: Installing and starting initial bundles
```
