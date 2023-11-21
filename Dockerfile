FROM registry.gitlab.steamos.cloud/steamrt/sniper/sdk

WORKDIR /cs2kz
COPY . .

# Install SteamCMD
WORKDIR /cs2kz
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note "" | debconf-set-selections
RUN apt-get install -y steamcmd
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
