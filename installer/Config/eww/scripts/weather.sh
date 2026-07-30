#!/bin/bash

CITY=$(jq -r '.city' "$HOME/.config/theme/config.json")
API_KEY=$(jq -r '.api.openweather' "$HOME/.config/theme/config.json")

DATA=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=${CITY}&units=metric&appid=${API_KEY}&lang=es")

# Datos principales
TEMP=$(echo "$DATA" | jq ".main.temp" | xargs printf "%.0f")
DESC=$(echo "$DATA" | jq -r ".weather[0].description")
ICON_CODE=$(echo "$DATA" | jq -r ".weather[0].icon")

# Definir icono según código de OpenWeather
# (usando Nerd Fonts o Font Awesome)
case $ICON_CODE in
  01d) ICON="" ;;  # Sol (día despejado)
  01n) ICON="" ;;  # Luna (noche despejada)
  02d|02n) ICON="" ;; # Parcialmente nublado
  03d|03n|04d|04n) ICON="" ;; # Nublado
  09d|09n) ICON="🌧" ;; # Lluvia ligera
  10d|10n) ICON="🌦" ;; # Lluvia
  11d|11n) ICON="⛈" ;; # Tormenta
  13d|13n) ICON="❄" ;; # Nieve
  50d|50n) ICON="🌫" ;; # Niebla
  *) ICON="" ;; # Termómetro por defecto
esac

# Color opcional según clima
case $ICON_CODE in
  01d) HEX="#f1c40f" ;; # Amarillo sol
  01n) HEX="#2980b9" ;; # Azul noche
  02d|02n) HEX="#95a5a6" ;; # Gris claro
  09d|09n|10d|10n) HEX="#3498db" ;; # Azul lluvia
  11d|11n) HEX="#9b59b6" ;; # Morado tormenta
  13d|13n) HEX="#ecf0f1" ;; # Blanco nieve
  50d|50n) HEX="#7f8c8d" ;; # Gris niebla
  *) HEX="#ffffff" ;;
esac

# Salidas individuales (para EWW defpoll)
case "$1" in
  temp) echo "$TEMP" ;;
  desc) echo "$DESC" ;;
  icon) echo "$ICON" ;;
  city) echo "$CITY" ;;
  hex)  echo "$HEX" ;;
  *)
    echo "Uso: $0 {temp|desc|icon|city|hex}"
    ;;
esac