FROM registry.gitlab.steamos.cloud/steamrt/sniper/sdk
WORKDIR /cs2kz

# Install SteamCMD
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note "" | debconf-set-selections
RUN apt-get install -y steamcmd curl python3-pip
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd
RUN steamcmd +quit

COPY . .

RUN git clone https://github.com/alliedmodders/ambuild.git
RUN python3 -m pip install ./ambuild

ENTRYPOINT [ "./docker-entrypoint.sh" ]
