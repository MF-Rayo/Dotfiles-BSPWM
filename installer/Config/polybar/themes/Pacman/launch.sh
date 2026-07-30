#!/usr/bin/env bash

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    polybar -q top -c "$HOME/.config/polybar/themes/Pacman/config.ini" &
}

launch_bar