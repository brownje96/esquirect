#!/bin/bash

# first, clean up from any previous sessions
rm -rf /tmp/.X1-lock

# Check on the music...
/app/mkpls.sh /app/music

# X11 Stuff
Xvfb $DISPLAY -screen 0 1024x768x24 &
echo "Waiting 10 seconds for x11 virtual framebuffer to start"
sleep 10s
x11vnc -display :1.0 -N -forever -passwd $VNC_PASSWD &

# Stream
nginx
./stream.sh &

# Emulator.
./update.sh 300 &
fs-uae 	--fullscreen --show_osd=0 --floppy-drive-0=/app/prevue.adf --amiga-model=A500+ --kickstart_file=/app/ks.rom --chip_memory=1024 --fast_memory=8192 --ntsc_mode=1 --uae_sound_output=interrupts --border=0 --serial_port="tcp://127.0.0.1:5543"
# --uae-rtc=MSM6242B
