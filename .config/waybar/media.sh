#!/usr/bin/env bash

# Fetch details from playerctl (suppress errors if no player is active)
title=$(playerctl metadata xesam:title 2>/dev/null | xargs)
artist=$(playerctl metadata xesam:artist 2>/dev/null | xargs)
player_name=$(playerctl -l 2>/dev/null | head -n 1 | cut -d'.' -f1 | xargs)
status=$(playerctl status 2>/dev/null | xargs)

# If no title or player active, return fallback JSON
if [ -z "$title" ]; then
    printf '{"text": "Media", "tooltip": "No media playing"}\n'
    exit 0
fi

# Truncate title to 30 characters
short_title="${title:0:30}"

# Format status to lower-case for the class
status_lower=$(echo "$status" | tr '[:upper:]' '[:lower:]')

# Format multi-line tooltip string
tooltip="Song: ${title}"$'\n'"Artist: ${artist}"$'\n'"Source: ${player_name}"$'\n'"Status: ${status}"
# Use jq with -c (compact) to ensure it prints on a single line
if command -v jq &>/dev/null; then
    jq -nc \
        --arg text "$short_title" \
        --arg tooltip "$tooltip" \
        --arg class "$status_lower" \
        '{text: $text, tooltip: $tooltip, class: $class}'
else
    # Safe JSON string escaping via python fallback
    python3 -c 'import json, sys; print(json.dumps({"text": sys.argv[1], "tooltip": sys.argv[2], "class": sys.argv[3]}))' "$short_title" "$tooltip" "$status_lower"
fi
