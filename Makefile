gameserver:
	steamcmd \
		+force_install_dir /cs2kz/server \
		+login anonymous \
		+app_update 730 validate \
		+quit

	mkdir -p /root/.steam/sdk64/
	cp /root/.local/share/Steam/steamcmd/linux64/steamclient.so /root/.steam/sdk64/steamclient.so
	make metamod

metamod:
	curl -L "https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1270-linux.tar.gz" \
		-o /cs2kz/server/game/csgo/metamod.tar.gz

	cd /cs2kz/server/game/csgo/ \
		&& tar -xvzvf metamod.tar.gz \
		&& rm metamod.tar.gz

	sed -i '22 s/^/\r\n\t\t\tGame\tcsgo\/addons\/metamod\r\n/' /cs2kz/server/game/csgo/gameinfo.gi

run:
	/cs2kz/server/game/cs2.sh \
		-dedicated \
		+sv_lan 1 \
		+ip 0.0.0.0 \
		+port 27015 \
		+map de_mirage

clean:
	rm -rf server
