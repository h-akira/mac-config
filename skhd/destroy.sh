row=$(yabai -m query --spaces | jq 'map(select(."windows" == []))' | jq 'reverse' | jq '.[].index')
if [ -n "${row}" ]; then
  for i in ${row}
  do
    yabai -m space --destroy $i
  done
fi
