#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar apps -c ~/.config/polybar/themes/Round/current.ini &
polybar date -c ~/.config/polybar/themes/Round/current.ini &
polybar interface -c ~/.config/polybar/themes/Round/current.ini &
polybar vpn -c ~/.config/polybar/themes/Round/current.ini &

## Center bar
polybar primary -c ~/.config/polybar/themes/Round/workspace.ini &

## Right bar
polybar target -c ~/.config/polybar/themes/Round/current.ini &
polybar cpu_ram -c ~/.config/polybar/themes/Round/current.ini &
polybar battery -c ~/.config/polybar/themes/Round/current.ini &
polybar power -c ~/.config/polybar/themes/Round/current.ini &