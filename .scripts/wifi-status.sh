#!/bin/bash
# Auto-detect the wireless interface (first wl* under /sys/class/net).
iface=$(basename "$(find /sys/class/net -maxdepth 1 -name 'wl*' | head -1)" 2>/dev/null)
quality=$(awk -v i="$iface" '$1 ~ i {print int($3)}' /proc/net/wireless 2>/dev/null)
ssid=$(iwgetid -r 2>/dev/null)

if [ -z "$ssid" ]; then
    echo "WiFi OFF"
    exit 0
fi

if [ "$quality" -ge 60 ]; then
    bars="▁▃▅▇"
elif [ "$quality" -ge 40 ]; then
    bars="▁▃▅ "
elif [ "$quality" -ge 20 ]; then
    bars="▁▃  "
else
    bars="▁   "
fi

echo "%{T2}${bars}%{T1} ${ssid}"
