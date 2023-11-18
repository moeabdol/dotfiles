#!/usr/bin/env bash

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# merge in defaults and keymaps

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
	xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

nvidia-settings --load-config-only &
xset s 0 0 dpms 0 0 0 &
# xset m 1/10000 0 &
xrandr --output HDMI-1 --mode 1920x1080 --primary --output DP-0 --mode 1920x1080 --right-of HDMI-1 &
feh --no-fehbg --bg-fill ~/Pictures/wallpapers/tokyo-night32.png &
unclutter --timeout 5 &
exec i3
