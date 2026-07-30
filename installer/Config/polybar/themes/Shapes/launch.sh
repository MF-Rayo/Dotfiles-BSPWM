#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q top -c $HOME/.config/polybar/themes/Shapes/config.ini &
polybar -q bottom -c $HOME/.config/polybar/themes/Shapes/config.ini &