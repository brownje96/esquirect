#!/bin/bash

rm -rf /app/work/hls
mkdir /app/work/hls

export ECT_FFMPEG="/usr/bin/ffmpeg"
# Input
export INP_AUDIO="-f concat -safe 0 -i /app/work/playlist.txt -stream_loop -1"
export INP_VIDEO="-thread_queue_size 4096 -f x11grab -r 30 -s 1000x580 -i :1.0"
# Output
export OUT_VIDEO="-preset ultrafast -c:v libx264"
export OUT_AUDIO="-metadata:s:a:0 language=eng -c:a aac -b:a 128k"
# Destination
export DEST="-f hls -hls_time 6 -hls_list_size 6 -hls_flags delete_segments /app/work/hls/stream.m3u8"

# actual logic
if [ -f /app/work/NO_MUSIC ]; then
        echo "Music directory was flagged as empty- not including in ffmpeg stream."
        ${ECT_FFMPEG} ${INP_VIDEO} ${OUT_VIDEO} ${DEST}
else
        echo "Music directory was flagged as populated- including in ffmpeg stream."
        ${ECT_FFMPEG} ${INP_AUDIO} ${INP_VIDEO} ${OUT_VIDEO} ${OUT_AUDIO} ${DEST}
fi
