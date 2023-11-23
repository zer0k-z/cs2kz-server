FROM registry.gitlab.steamos.cloud/steamrt/sniper/sdk
WORKDIR /cs2kz

# Install SteamCMD
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note "" | debconf-set-selections
RUN apt-get install -y steamcmd curl
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd
RUN steamcmd +quit

COPY . .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
