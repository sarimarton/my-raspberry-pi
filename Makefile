install:
	cp ./automation.desktop ~/.config/autostart
	git submodule update --init

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
