install:
	cp ./automation.desktop ~/.config/autostart
	git submodule update --init
	sudo apt -y update
	sudo apt -y install cmake autotools-dev automake libpulse-dev libasound-dev libjack-dev
	cmake -S . -B _build -DCMAKE_INSTALL_PREFIX="${PWD}/_install"
	cmake --build _build --target install

start:
	$(pkill -f vban_emitter)
	~/projects/my-raspberry-pi/vban/_install/bin/vban_emitter -i 192.168.0.2 -p 6980 -s rpi &
	~/projects/my-raspberry-pi/vban/_install/bin/vban_emitter -i 192.168.0.14 -p 6980 -s rpi &
	./automation.sh

stop:
	pkill -f vban_emitter

temp:
	vcgencmd measure_temp

.DEFAULT_GOAL := start
