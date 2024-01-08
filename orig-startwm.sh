#!/bin/bash

if [ -f "${HOME}"/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml ]; then
  sed -i \
    '/use_compositing/c <property name="use_compositing" type="bool" value="false"/>' \
    "${HOME}"/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
fi
sudo /etc/init.d/dbus start
sudo /etc/init.d/xrdp start
sudo /etc/init.d/pulseaudio-enable-autospawn start
/usr/bin/xfce4-session > /dev/null 2>&1
firefox --kiosk http://192.168.1.205:8123
