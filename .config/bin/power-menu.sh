#!/bin/sh

choice=$(printf "Reboot\nSuspend\nPoweroff\nHibernate\nExit Sway" | wofi --dmenu --cache-file /dev/null --prompt "Power Menu")

case "$choice" in
    "Reboot")    systemctl reboot ;;
    "Suspend")   systemctl suspend ;;
    "Poweroff")  systemctl poweroff ;;
    "Hibernate") systemctl hibernate ;;
    "Exit Sway") swaymsg   exit ;;
esac
