#!/bin/bash
powered=$(bluetoothctl show 2>/dev/null | grep "Powered:" | awk '{print $2}')
if [ "$powered" = "yes" ]; then
    connected=$(bluetoothctl devices Connected 2>/dev/null | head -1)
    if [ -n "$connected" ]; then
        name=$(echo "$connected" | cut -d' ' -f3-)
        echo "BT $name"
    else
        echo "BT"
    fi
else
    echo "BT OFF"
fi
