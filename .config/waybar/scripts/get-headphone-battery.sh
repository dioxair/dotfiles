#!/bin/bash

DEVICE_PATH=$(upower -e | grep "dev_90_7A_58_ED_29_CB")

ICON=" 󰋎 "
ICON_OFF=" 󰋐 "

BAT_ICONS=(" " " " " " " " " ")

if [ -z "$DEVICE_PATH" ]; then
  echo "{\"text\": \"${ICON_OFF} N/A\", \"class\": \"disconnected\", \"tooltip\": \"Sony WH-XB910N (not connected)\"}"
  exit 1
fi

BATTERY_PERCENT=$(upower -i "$DEVICE_PATH" | grep -E "percentage" | awk "{print \$2}" | tr -d "%")

if [ -z "$BATTERY_PERCENT" ]; then
  echo "{\"text\": \"${ICON} N/A\", \"class\": \"unknown\", \"tooltip\": \"Sony WH-XB910N (battery unknown)\"}"
  exit 1
fi

if [ "$BATTERY_PERCENT" -ge 100 ]; then
  ICON_INDEX=4
elif [ "$BATTERY_PERCENT" -ge 75 ]; then
  ICON_INDEX=3
elif [ "$BATTERY_PERCENT" -ge 50 ]; then
  ICON_INDEX=2
elif [ "$BATTERY_PERCENT" -ge 25 ]; then
  ICON_INDEX=1
else
  ICON_INDEX=0
fi

BAT_ICON=${BAT_ICONS[$ICON_INDEX]}

if [ "$BATTERY_PERCENT" -ge 100 ]; then
  CLASS="full"
  TOOLTIP="Sony WH-XB910N — Full"
elif [ "$BATTERY_PERCENT" -lt 20 ]; then
  CLASS="critical"
  TOOLTIP="Sony WH-XB910N — Critical, charge now"
else
  CLASS=""
  TOOLTIP="Sony WH-XB910N — ${BATTERY_PERCENT}%"
fi

echo "{\"text\": \"${ICON} ${BAT_ICON} ${BATTERY_PERCENT}%\", \"class\": \"${CLASS}\", \"tooltip\": \"${TOOLTIP}\"}"
