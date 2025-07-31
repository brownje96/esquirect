#!/bin/bash

# first, clean up from any previous sessions
rm -rf /tmp/.X1-lock

# System Services
service cron start
anacron start

# X11 Stuff
Xvfb $DISPLAY -screen 0 1024x768x16 &
x11vnc -display :1.0 -N -forever -passwd $VNC_PASSWD &

# Stream
nginx

# Emulator.
./update.sh 300 &
fs-uae 	--fullscreen --show_osd=0 --floppy-drive-0=/app/prevue.adf --amiga-model=A500+ --kickstart_file=/app/ks.rom --chip_memory=1024 --fast_memory=8192 --uae-rtc=MSM6242B --ntsc_mode=1 --uae_sound_output=interrupts --border=0 --serial_port="tcp://127.0.0.1:5543"
