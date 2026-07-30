#!/bin/bash

STATE_FILE="/tmp/polybar_net_state"
touch "$STATE_FILE"

read -r STATE < "$STATE_FILE" 2>/dev/null || STATE=0

if [[ "$STATE" == "0" ]]; then
    ~/.config/bin/scripts/net_config/my_ip.sh
else
    ~/.config/bin/scripts/net_config/interface_speed.sh
fi