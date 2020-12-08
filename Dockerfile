#
# TZ Clan Server Configuration
#
# This Dockerfile creates a DOD Source Server with some neat plugins
# for Tolerância Zero clan

FROM steamcmd/steamcmd:latest

# Download DOD and install Source Server
RUN mkdir /usr/local/dodsource
RUN steamcmd +login anonymous +force_install_dir /usr/local/dodsource +app_update 232290 +quit
WORKDIR /usr/local/dodsource/dod

# Installs some dependency tools
RUN /bin/bash -c 'apt-get update; \
apt-get install -y wget'

# Installs Sourcemod and other dependencies
RUN wget -O - -o /dev/null https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6499-linux.tar.gz | tar xvz
RUN wget -O - -o /dev/null https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1143-linux.tar.gz | tar xvz

# Installs Kill Death Ratio Checker sourcemod plugin
RUN /bin/bash -c 'wget -o /usr/local/dodsource/dod/addons/sourcemod/plugins/kdchecker.smx \
        https://forums.alliedmods.net/attachment.php?attachmentid=133406&d=1399814799'

# Install configuration files
COPY server_files/server.cfg /usr/local/dodsource/dod/cfg
COPY server_files/start_server.sh /usr/local/dodsource

EXPOSE 27015
WORKDIR /usr/local/dodsource
ENTRYPOINT ["/usr/local/dodsource/start_server.sh"]

