container:
	@if [ $$(ls /cs2kz/server | wc -l) -gt 1 ]; then make steamclient; else make gameserver; fi
	@if [ ! -d "/cs2kz/server/game/csgo/addons" ]; then make metamod; fi
	@if [ ! -d "/cs2kz/cs2kz-metamod/build_lin/package" ]; then make plugin; fi
	@if [ ! -d "/cs2kz/server/game/csgo/addons/metamod/cs2kz" ]; then make kz; fi

steamclient:
	mkdir -p /root/.steam/sdk64/
	cp /root/.local/share/Steam/steamcmd/linux64/steamclient.so /root/.steam/sdk64/steamclient.so

gameserver:
	steamcmd \
		+force_install_dir /cs2kz/server \
		+login anonymous \
		+app_update 730 \
		+quit

	make steamclient

metamod:
	@export latestMM=$(curl https://mms.alliedmods.net/mmsdrop/2.0/mmsource-latest-linux -s -S);
	@export mmURL="https://mms.alliedmods.net/mmsdrop/2.0/${latestMM}";

	curl -L $(mmURL) \
		-o /cs2kz/server/game/csgo/metamod.tar.gz

	cd /cs2kz/server/game/csgo/ \
		&& tar -xvzvf metamod.tar.gz \
		&& rm metamod.tar.gz

	@if [ $$(grep "metamod" server/game/csgo/gameinfo.gi | wc -l) -eq 0 ]; then sed -i '22 s/^/\r\n\t\t\tGame\tcsgo\/addons\/metamod\r\n/' /cs2kz/server/game/csgo/gameinfo.gi; fi

metamod-clean:
	rm -rf /cs2kz/server/game/csgo/addons

kz:
	cp -r /cs2kz/cs2kz-metamod/build_lin/package/* /cs2kz/server/game/csgo/

run:
	tail -f /dev/null
	
plugin:
	mkdir -p /cs2kz/cs2kz-metamod/build_lin
	cd /cs2kz/cs2kz-metamod/build_lin; \
	python3 ../configure.py; \
	ambuild
	make kz

runkz:
	/cs2kz/server/game/cs2.sh \
		-dedicated \
		+sv_lan 1 \
		+ip 0.0.0.0 \
		+port 27015 \
		+map de_mirage \
		-nowatchdog \
		-dev \
		-debug \
		+host_workshop_map 3070194623

clean:
	rm -rf server
