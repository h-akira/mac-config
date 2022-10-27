DIR=${HOME}/.config/skhd
if [ $1 -eq 1 ]; then
  yabai -m window --space first
  yabai -m space --focus first
elif [ $1 -eq 9 ]; then
  yabai -m window --space last
  yabai -m space --focus last
else
  yabai -m window --space $1
  if [ $? -eq 0 ]; then
    yabai -m space --focus $1
  else
    yabai -m space --create
    yabai -m window --space last
    yabai -m space --focus last
  fi
fi
sh ${DIR}/destroy.sh
