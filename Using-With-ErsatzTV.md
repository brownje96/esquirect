# Using with ErsatzTV

## Disclaimer on my technical ability
I'm not an expert in streaming or encoding. This is a hobbyist project. I'm reporting what works for me. As

## Disclaimer on your liability
You should be aware of your legal risks to using or misrepresenting any of the trademarks or intellectual property used.

## ffmpeg profile
Create a profile that does not use hardware acceleration. Assign your EPG/Guide channel to use said profile. This project itself does not use HW Accel either right now.

## Remote Stream Descriptor
A working YAML file is included, you just need to adjust to your hostname or IP address. Make sure this file is visible in ErsatzTV's built in "Remote Streams" library. The RTMP stream works. The HLS one seems to cause ffmpeg to leak memory and never re-encode.

From there, you can add the item to a collection, and schedule it. Voilà.

