#!/bin/bash
player=$(playerctl -l | head -n1)

if [ -z "$player" ]; then
  echo "No Player"
  exit 0
fi

# Archivo para guardar último título y posición
last_title_file="/tmp/current_player_title"
position_reset_file="/tmp/position_needs_reset"

# Get current title
current_title=$(playerctl -p "$player" metadata --format '{{title}}')

# Check if title changed
if [ ! -f "$last_title_file" ] || [ "$(cat $last_title_file)" != "$current_title" ]; then
    # Title changed, mark that position needs reset
    echo "1" > "$position_reset_file"
    # Save new title
    echo "$current_title" > "$last_title_file"
fi

# If we need to reset position, output a special marker
if [ -f "$position_reset_file" ] && [ "$(cat $position_reset_file)" = "1" ]; then
    if [ "$1" = "RESET_POSITION" ]; then
        echo "RESET"
        # Clear the reset flag
        echo "0" > "$position_reset_file"
        exit 0
    fi
fi

# Show the requested metadata
playerctl -p "$player" metadata --format "$1"