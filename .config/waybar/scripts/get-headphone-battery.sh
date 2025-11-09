#!/bin/bash

DEVICE_PATH=$(upower -e | grep 'dev_90_7A_58_ED_29_CB')
ICON=" 󰋎"
ICON_OFF="󰋐"

if [ -z "$DEVICE_PATH" ]; then
    echo "{\"text\": \"${ICON_OFF} N/A\", \"class\": \"disconnected\", \"tooltip\": \"Sony WH-XB910N (not connected)\"}"
    exit 0
fi

BATTERY_PERCENT=$(upower -i "$DEVICE_PATH" | grep -E "percentage" | awk '{print $2}' | tr -d '%')

if [ -z "$BATTERY_PERCENT" ]; then
    echo "{\"text\": \"${ICON} N/A\", \"class\": \"unknown\", \"tooltip\": \"Sony WH-XB910N (battery unknown)\"}"
    exit 0
fi

if [ "$BATTERY_PERCENT" -ge 100 ]; then
    CLASS="full"
    TOOLTIP="Sony WH-XB910N — Full"
elif [ "$BATTERY_PERCENT" -ge 20 ]; then
    CLASS="critical"
    TOOLTIP="Sony WH-XB910N — Critical, charge now"
fi

echo "{\"text\": \"${ICON} ${BATTERY_PERCENT}%\", \"class\": \"${CLASS}\", \"tooltip\": \"${TOOLTIP}\"}"
