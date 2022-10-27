DIR=${HOME}/.config/skhd
if [ $1 -eq 0 ]; then
  yabai -m space --focus first
  sh ${HOME}/.config/skhd/destroy.sh
elif [ $1 -eq 9 ]; then
  yabai -m space --focus last
  sh ${HOME}/.config/skhd/destroy.sh
else
  yabai -m space --focus $1
  if [ $? -eq 0 ]; then
    sh ${DIR}/destroy.sh
  else
    if [ "$(yabai -m query --spaces | jq 'map(select(."has-focus" == true))[-1].index')" -ne "$1" ]; then
      yabai -m space --create
      yabai -m space --focus last
    fi
  fi
fi
