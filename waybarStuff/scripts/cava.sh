#!/bin/bash

# NOT WORKING AND I HAVE NO CLUE IF IT EVER BE 


# Waybar Cava script using FIFO
# Creates a pipe for CAVA output and reads continuously

FIFO="/home/michoto/.config/cava/cava.fifo"
CONFIG="/home/michoto/.config/cava/config"


# Create pipe if not exist
if [ ! -p "$FIFO" ]; then
    mkfifo "$FIFO"
fi

cava

# Read cava output & convert to Waybar json format
while read -r line; do
    # Convert raw values to index 0–7
    json="["
    for lvl in $line; do
        index=$((lvl / 32))
        [ $index -gt 7 ] && index=7
        json="$json$index,"
    done
    json="${json::-1}]"

    echo "{\"percentage\": 50, \"values\": $json}"
done < "$FIFO"
