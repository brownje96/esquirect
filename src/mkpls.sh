#!/bin/bash

if [ ! -d $1 ]; then
    > /app/work/NO_MUSIC
    exit 1
fi

INPUT_DIR=$1

> /app/work/playlist.txt

#todo: may not be needed and actually problematic.
echo "ffconcat version 1.0" >> /app/work/playlist.txt

for file in "$INPUT_DIR"/*; do
    if [[ $file == *.m4a ]]; then
        echo "file '$file'" >> /app/work/playlist.txt
    fi
done
