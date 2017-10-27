# Run file-share container using docker-compose

Make sure your published ip address and ports are available before starting.
For example, 
- tftp requires udp 69 port for running.
- ftp requires tcp 20, 21 and 65500-65515 ports for running.
- They should NOT be allocated to other processes or docker containers.

```shell
docker-compose up -d
```

# Stop file-share container

Stop the gitlab container using the following command.

```shell
docker-compose down
```

