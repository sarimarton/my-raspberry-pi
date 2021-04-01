# flash a new image
# copy files
# one-time setup?

ssh-copy-id pi@192.168.0.12

sudo echo -e "macska\nmacska" | passwd pi

# turn on ssh
sudo raspi-config nonint do_ssh 0

# turn on vnc
sudo raspi-config nonint do_vnc 0

# avoid vnc problems in headless
sudo raspi-config nonint do_resolution 1920 1080

sudo raspi-config nonint do_boot_splash 1

# prevent raspberry BT audio devices to show up among the Mac's sound devices
sudo apt-get remove -y pulseaudio-module-bluetooth

# install Across Center
sudo apt-get -y install libbluetooth-dev
wget https://d1iwm8e3p5jejt.cloudfront.net/across-linux-armv7-2_22.tar.gz
sudo ./install.sh
/usr/local/bin/across/AcrossCenter

# automation tools
sudo apt-get install -y xdotool
sudo apt-get install -y xclip

# install vscode
sudo apt install

# autostart in desktop
mkdir -p ~/projects
cp ./automation.desktop /home/pi/.config/autostart
cp ./automation.sh /home/pi/projects
