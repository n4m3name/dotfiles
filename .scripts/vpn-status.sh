#!/bin/bash
status=$(mullvad status 2>/dev/null | head -1)
if echo "$status" | grep -q "Connected"; then
    echo "VPN"
else
    echo "VPN OFF"
fi
