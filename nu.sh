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
    echo "-------------------"
    wifi_total=$(get_usage "wlan0" | format)
    eth_total=$(get_usage "eth0" | format)
    total_usage=$(get_usage "wlan0+eth0" | format)
    echo "WiFi: $wifi_total"
    echo "Ethernet: $eth_total"
    echo "******************"
    echo "Total: $total_usage"
    echo "******************"
    sleep 5
done
