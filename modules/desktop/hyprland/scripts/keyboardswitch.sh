#!/usr/bin/env sh

scrDir=$(dirname "$(realpath "$0")")
source $scrDir/globalcontrol.sh

hyprctl switchxkblayout all next

layMain=$(hyprctl -j devices | jq '.keyboards' | jq '.[] | select (.main == true)' | awk -F '"' '{if ($2=="active_keymap") print $4}')

# dunstify "${layMain}" -i ~/.config/hypr/icons/keyboard.svg -a "Keyboard Layout" -r 91190 -t 800
notify-send -a "Keyboard Layout" -r 91190 -t 800 -i "$XDG_CONFIG_HOME/hypr/icons/keyboard.svg" "${layMain}"

