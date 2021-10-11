install:
	cp ./automation.desktop ~/.config/autostart

start:
	sleep 10s
	$(pkill -f vban_emitter)
	~/projects/vban/_install/bin/vban_emitter -i 192.168.0.2 -p 6980 -s rpi &
	~/projects/vban/_install/bin/vban_emitter -i 192.168.0.14 -p 6980 -s rpi &
	./automation.sh

stop:
	pkill -f vban_emitter

.DEFAULT_GOAL := start
