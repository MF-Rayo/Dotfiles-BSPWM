#!/bin/bash
# Script para lanzar la barra de Eww con workspaces dinámicos
# Adaptado desde gh0stzk/dotfiles para ~/.config/eww

# Genera el archivo workspaces.yuck dinámicamente
generate_eww_workspaces() {
    eww_file="${HOME}/.config/eww/workspaces.yuck"
    monitors=$(bspc query -M --names)
    count=0
    listen_workspaces=""
    widgets=""
    workspace_widgets=";; Workspaces Widgets ;;\n"

    printf "%s\n" ";; Workspaces ;;" > "$eww_file"

    for m in $monitors; do
        workspace_name="workspace${count}"
        listen_workspaces="${listen_workspaces}(deflisten ${workspace_name} \"${HOME}/.config/eww/scripts/WorkSpaces $m\")\n"
        widgets="${widgets}           (box :visible { monitor==\"$m\" } (${workspace_name}))\n"
        workspace_widgets="${workspace_widgets}(defwidget ${workspace_name} [] (literal :content ${workspace_name}))\n"
        count=$((count + 1))
    done

    printf "%b" "$listen_workspaces" >> "$eww_file"
    printf "%b" "$workspace_widgets" >> "$eww_file"
    printf "%b" ";; Workspaces Main Widget ;;\n(defwidget workspaces [monitor]\n   (box    :orientation \"v\"\n           :space-evenly \"false\"\n           :valign \"start\"\n$widgets))" >> "$eww_file"
}

# Ejecutar la generación del archivo workspaces.yuck
generate_eww_workspaces

# Obtener lista de monitores y ordenar para que el primario vaya primero
monitors=$(xrandr -q | grep -w 'connected' | sort -k3n | cut -d' ' -f1)
count=0
for m in $monitors; do
    eww -c "${HOME}/.config/eww" open bar --id "$m" --arg monitor="$m" --toggle --screen "$count"
    count=$((count + 1))
done

# Fix: ocultar la barra al entrar en fullscreen
bspc subscribe node_state | while read -r _ _ _ _ state flag; do
    [ "$state" = "fullscreen" ] || continue
    if [ "$flag" = "on" ]; then
        HideBar -h
    else
        HideBar -u
    fi
done &
