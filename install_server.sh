#!/bin/bash

APP=232290
docker run -it -v $PWD/tzserver:/data steamcmd/steamcmd:latest +login anonymous +force_install_dir /data +app_update $APP +quit










