# PREPARE KIADASAIM SHEET ON Data!A2 cell focused

url='https://docs.google.com/spreadsheets/d/12D9OQ4pGwiiVU4krN--Lk3iObmcpqAJ4rSuWkc-cRxo/edit#gid=845405153'

w=$(for id in $(xdotool search --class 'Chromium'); do
  if [[ "$(xdotool getwindowname $id)" =~ Kiadásaim[[:space:]]-[[:space:]]Google[[:space:]]Sheets[[:space:]]-[[:space:]]Chromium$ ]]; then
    echo $id;
  fi;
done)

if [[ -n "$w" ]]; then
  echo aktivalunk
  xdotool windowactivate $w
  sleep 2
  xdotool key --window $w ctrl+l
  sleep 2
  xdotool key --window $w ctrl+c
  sleep 2
  if ! [ $url == $(xclip -o -sel c) ]; then
    xdotool type --window $w --delay 25 'https://docs.google.com/spreadsheets/d/12D9OQ4pGwiiVU4krN--Lk3iObmcpqAJ4rSuWkc-cRxo/edit#gid=845405153'
    xdotool key --window $w Return
    sleep 10
  fi
  xdotool key --window $w Tab
  xdotool key --window $w ctrl+Home
else
  w=$(for id in $(xdotool search --class 'Chromium'); do
    if [[ "$(xdotool getwindowname $id)" =~ [[:space:]]-[[:space:]]Chromium$ ]]; then
      echo $id
    fi
  done)

  xdotool windowactivate $w
  sleep 2
  xdotool key --window $w ctrl+t
  sleep 2
  xdotool type --window $w --delay 25 'https://docs.google.com/spreadsheets/d/12D9OQ4pGwiiVU4krN--Lk3iObmcpqAJ4rSuWkc-cRxo/edit#gid=845405153'
  xdotool key --window $w Return
  sleep 30
fi



