while true; do
clear
vnstat -d 1 -i "wlan0+eth0" | sed -n '6p' | awk '{print $8,$9}'
sleep 5
done
