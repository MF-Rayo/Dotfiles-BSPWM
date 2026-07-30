#!/bin/bash
source ~/.config/theme/colors/bin.sh

json="$HOME/.target.json"
polybar=$(jq -r '.polybar' "$HOME/.config/theme/config.json")

if [ ! -f "$json" ] || [ "$(jq '.target // null' "$json")" = "null" ]; then
    
    if [[ "$polybar" = "Lofi" || "$polybar" = "Pacman" || "$polybar" = "Shapes" ]]; then
        echo "" && exit
    else
        echo "%{F$icon}ﲅ %{u-}%{F$fg_icon} No target" && exit
    fi

else
    if [ "$polybar" = "Lofi" ]; then
        target="󰯐"
    else
        target="什"
    fi
    ip_target=$(jq -r --argjson id "$(jq '.target | tonumber' "$json")" '.items[] | select(.id == $id) | .target' "$json")
    echo "%{F$icon}${target}%{F$fg_icon} $ip_target"
fi