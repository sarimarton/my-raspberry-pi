install:
	cp ./automation.desktop ~/.config/autostart
	git submodule update --init
	sudo apt -y update
	sudo apt -y install cmake autotools-dev automake libpulse-dev libasound-dev libjack-dev
	cmake -S . -B _build -DCMAKE_INSTALL_PREFIX="${PWD}/_install"
	cmake --build _build --target install

start:
	# I couldn't figure out how to make pkill work in both already running and not
	# yet running cases, so I just force launch another process...
	./vban/_install/bin/vban_emitter -i 192.168.0.2 -p 6980 -s rpi &
	pkill -x vban_emitter
	./vban/_install/bin/vban_emitter -i 192.168.0.2 -p 6980 -s rpi &
	./vban/_install/bin/vban_emitter -i 192.168.0.14 -p 6980 -s rpi &
	./automation.sh

stop:
	pkill -x vban_emitter

temp:
	vcgencmd measure_temp

.DEFAULT_GOAL := start
