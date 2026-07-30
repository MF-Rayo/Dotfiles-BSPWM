#!/usr/bin/env bash

launch_bar() {
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch the bar
    polybar main -c "$HOME/.config/polybar/themes/Lofi/config.ini" &
}

launch_bar