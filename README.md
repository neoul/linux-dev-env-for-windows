
# Linux development environment using docker for windows

## Prerequisite

- windows 10
- Install docker for windows
- Install git for windows

## Update your development environment

### 1. Edit .env file to setup your internal LAN domain.

``` shell
USER=neoul # Your development account ID
UID=1000 # Your development account UID
PASSWD=admin # Your development account password
HOSTIP=192.168.0.78 # Your Host IP
MYSUBNET_AND_MASK=10.10.0.0/16 # Your development domain
MYMACHINE=10.10.0.2 # Your development Server IP
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

## Run your development-env containers

Make sure your published ip address and ports are available before starting.
For example, 
- tftp requires udp 69 port for running.
- ftp requires tcp 20, 21 and 65500-65515 ports for running.
- They should NOT be allocated to other processes or docker containers.

```shell
docker-compose up -d
```

## Access your local linux machine

- via ssh
- via samba file sharing

``` shell
ssh 10.10.0.2
```

## Stop development-env containers

You can stop your containers using the following command.

```shell
docker-compose stop
```

## Remove your containers.

You can remove your container using the following command.

```shell
docker-compose down
```
