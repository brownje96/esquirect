# esquirect
A loose collection of bash scripts, configuration files, bubblegum and paperclips that happens to function as a container for running and streaming the Esquire Electronic Program Guide.
## What is Esquire?
An electronic program guide from the 1990s, written for the Commodore Amiga, which presumably was ran at local cable TV headends.
## Usage:
Environmental Variables:


|Variable|Mandatory|Description|
|--------|---------|-----------|
|VNC_PASSWD|✅|Password to access the environment|
|XMLTV_LOCATION|✅|A URL to a valid XMLTV file|


Paths/Mounts:
|Path in CT|Mandatory|Description|
|--------|--------|--------|
|/app/prevue.adf|✅|Disk Image of the UVG Esquire EPG Software|
|/app/ks.rom|✅|Commodore Business Machines AMiGA 500+ "KickStart" (BIOS) ROM version 2.4|
|/app/music|❎|Path with music to play in the background. Filenames are sensitive. No apostrophes/single quotes.|


## Components you will need
You must acquire a disk image of UVG Esquire, and the Amiga KickStart 2.04 BIOS ROM. I cannot help you with this.

## Running
At this point in time- you will have to build the container yourself. A script is included, as well as a Docker Compose file. It's relatively painless, but in short-

```
./build.sh
docker compose up -d
```
## Usage:

Connect from RTMP using the URL `rtmp://your_docker_host:1935/live/stream`

Connect from HLS Streaming using the URL `http://your_docker_host/hls/stream.m3u8`


## Stacks used:
[FS-UAE - Commodore Amiga Emulator](https://github.com/FrodeSolheim/fs-uae)

[PrevueCLI - Utility for converting between XMLTV and Prevue listing formats](https://github.com/AriX/PrevueCLI)

[ffmpeg - Video Toolkit](https://git.ffmpeg.org/gitweb/ffmpeg.git)

[Xorg](www.x.org)

[nginx](https://github.com/nginx/nginx)
