#!/usr/bin/bash


format() {
    awk 'NR==6 {print $8, $9}'
}

get_usage() {
    vnstat -d 1 -i "$1"
}

while true; do
    clear
    echo $(date)
    wifi_total=$(get_usage "wlan0" | format)
    eth_total=$(get_usage "eth0" | format)
    echo "WiFi: $wifi_total"
    echo "Ethernet: $eth_total"
    sleep 5
done
