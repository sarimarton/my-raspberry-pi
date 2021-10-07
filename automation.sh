sleep 10s

# try with 2 coordinates, because the 1st one may be occupied by Focusrite
xdotool mousemove 1720 20 click 1
sleep 1s
xdotool click 1

sleep 2s

xdotool mousemove 1680 20 click 1
sleep 1s
xdotool click 1

sleep 5s

aid=$(for id in $(xdotool search --class 'AcrossCenter'); do
  if [ "Across Center" == "$(xdotool getwindowname $id)" ]; then
    echo $id
  fi
done)

# xdotool windowmove $aid 25% 25%

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





