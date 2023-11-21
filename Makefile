gameserver:
	steamcmd \
		+force_install_dir /cs2kz/server \
		+login anonymous \
		+app_update 730 validate \
		+quit

	mkdir -p /root/.steam/sdk64/
	cp /root/.local/share/Steam/steamcmd/linux64/steamclient.so /root/.steam/sdk64/steamclient.so

run:
	/cs2kz/server/game/cs2.sh \
		-dedicated \
		+sv_lan 1 \
		+ip 0.0.0.0 \
		+port 27015 \
		+map de_mirage

clean:
	rm -rf server
