#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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


# enviromental values
export BROWSER="firefox"
export TERMINAL="urxvt"
export EDITOR="vim"
export IMAGE="sxiv"
export READER="zathura"


# Paths
export PATH=$PATH:$HOME/bin/system


# cjk Inputs
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
fcitx &
XMODIFIERS=@im=fcitx


# restore wal session
wal -R -n


# fix monitor positioning
/home/lain/bin/system/xrandr_dual_monitor &
feh --bg-scale --no-xinerama /home/lain/pictures/wallpaper/dual_pape/upper_station.jpg

# monitor/power settings
xset -dpms
xset s off


# autostart some programs
[ ! -s ~/.config/mpd/pid ] && mpd


# start window manager
exec i3

