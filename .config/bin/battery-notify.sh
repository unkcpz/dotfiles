#!/usr/bin/env bash

BATTERY_PATH="/sys/class/power_supply/BAT0"
THRESHOLD=10

# Exit if battery not present
[ -d "$BATTERY_PATH" ] || exit 0

CAPACITY=$(cat "$BATTERY_PATH/capacity")
STATUS=$(cat "$BATTERY_PATH/status")

if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le "$THRESHOLD" ]; then
    notify-send \
        -u critical \
        -t 15000 \
        -i battery-caution \
        "🚨 HOUSTON, WE HAVE A PROBLEM 🚨" \
        "Battery at ${CAPACITY}%\n"
fi
