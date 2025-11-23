#!/bin/bash
API="https://api.openweathermap.org/data/2.5/weather?q=Gdańsk&appid=20bc1b8e012ca6a9c5d008bfde61c15f"

DATA=$(curl -s "$API")

TEMP=$(echo "$DATA" | jq '.main.temp - 273.15 | round')
ICON=$(echo "$DATA" | jq -r '.weather[0].icon')

case "$ICON" in
    01d) WEATHER_ICON="☀️" ;; # clear day
    01n) WEATHER_ICON="🌕" ;; # clear night
    02d|02n) WEATHER_ICON="⛅" ;; # few clouds
    03d|03n) WEATHER_ICON="⛅" ;; # scattered clouds
    04d|04n) WEATHER_ICON="🌥️" ;; # broken clouds
    09d|09n) WEATHER_ICON="🌧️" ;; # shower rain
    10d|10n) WEATHER_ICON="🌦️" ;; # rain
    11d|11n) WEATHER_ICON="⛈️" ;; # thunderstorm
    13d|13n) WEATHER_ICON="🌨️" ;; # snow
    50d|50n) WEATHER_ICON="🌫️" ;; # mist
    *) WEATHER_ICON="🫪" ;; # unknown
esac

echo "$WEATHER_ICON ${TEMP}°C"