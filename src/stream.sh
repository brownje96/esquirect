#!/bin/bash

export ECT_FFMPEG="/usr/bin/ffmpeg"
export ECT_DEST="rtmp://localhost:1935/live/stream"
export ECT_MUS="/app/work/playlist.txt"
export ECT_QUEUE="4096"
export ECT_RES="1000x580"


if [ -f /app/work/NO_MUSIC ]; then
        echo "Music directory was flagged as empty."
        ${ECT_FFMPEG} -thread_queue_size ${ECT_QUEUE} -f x11grab -r 30 -s ${ECT_RES} -i :1.0 -c:v libx264 -crf 18 -c:a aac -f flv ${ECT_DEST}
else
        echo "Music directory was flagged as populated."
        ${ECT_FFMPEG} -f concat -safe 0 -i /app/work/playlist.txt -stream_loop -1 -thread_queue_size ${ECT_QUEUE} -f x11grab -r 30 -s ${ECT_RES} -i :1.0 -c:v libx264 -crf 18 -c:a aac -b:a 128k -f flv ${ECT_DEST}
fi
