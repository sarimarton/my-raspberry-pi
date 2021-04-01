sleep 10s

xdotool mousemove 1720 20 click 1

sleep 5s

aid=$(for id in $(xdotool search --class 'AcrossCenter'); do
  if [ "Across Center" == "$(xdotool getwindowname $id)" ]; then
    echo $id
  fi
done)

xdotool windowmove $aid 75% 25%

while true; do
  xdotool \
    windowactivate $aid \
    mousemove --window $aid 330 280

  sleep 1

  xdotool \
    mousemove --window $aid 320 280 \
    click --window $aid 1

  sleep 10s
done




# Uj tab es a Kiadasaim megnyitasa:
w=$(for id in $(xdotool search --class 'Chromium'); do
  if [[ "$(xdotool getwindowname $id)" =~ [[:space:]]-[[:space:]]Chromium$ ]]; then
    echo $id;
  fi;
done)

xdotool \
  windowactivate $w \
  key --window $w ctrl+t \
  type --window $w --delay 50 'https://docs.google.com/spreadsheets/d/12D9OQ4pGwiiVU4krN--Lk3iObmcpqAJ4rSuWkc-cRxo/edit#gid=845405153'

xdotool \
  key --window $w Return
