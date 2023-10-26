#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userprofile=$HOME/.xprofile
sysprofile=/etc/xprofile
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

[ -f $userprofile ] && . $userprofile

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    setxkbmap us
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# xrandr setting
xrandr --output DP-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --mode 2560x1440 --pos 2560x0 --rotate normal

# xcompmgr to fix zoom annotation issue
# https://support.zoom.us/hc/en-us/articles/202082128-Black-Screen-During-Screen-Sharing
xcompmgr -c -l0 -t0 -r0 -o.00 &

# Disable dmps to avoid screen auto-saver
# delay the command to sure it load after x is on
(sleep 10s && xset s off -dpms) &

exec i3 -V >> ~/.config/i3/i3log
#exec xfce4-session

