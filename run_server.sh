#!/bin/bash

docker run --rm -it -v $PWD/tzserver:/data --publish 192.168.0.13:27015:27015 --entrypoint=/data/start_server.sh steamcmd/steamcmd:latest










