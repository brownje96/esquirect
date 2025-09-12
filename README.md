# EsquireCT
A loose collection of bash scripts, configuration files, bubblegum and paperclips that happens to function as a container for running and streaming the Esquire Electronic Program Guide.
## What is Esquire?
An electronic program guide from the 1990s, written for the Commodore Amiga, which was ran both nationally and at local cable TV headends.
## Configuration:
Environmental Variables:

|Variable|Mandatory|Description|
|--------|---------|-----------|
|VNC_PASSWD|✅|Password to access the environment|
|XMLTV_LOCATION|✅|A URL to a valid XMLTV file|

Paths/Mounts:

|Path in CT|Mandatory|Description|
|--------|--------|--------|
|/app/prevue.adf|✅|Disk Image of the UVG Esquire EPG Software, preferably version 9.0.4|
|/app/ks.rom|✅|Commodore Business Machines AMiGA 500+ "KickStart" (BIOS) ROM version 2.4|
|/app/music|❎|Path with music to play in the background. Filenames are sensitive. No apostrophes/single quotes.|

NOTE: I cannot help you source any aforementioned intellectual property.

## Running
At this point in time- you will have to build the container yourself. A script is included, as well as a Docker Compose file. It's relatively painless, but in short-

```
./build.sh
docker compose up -d
```
## Usage:
Connect from HLS Streaming using the URL `http://your_docker_host/hls/stream.m3u8`

## Known Problems:
Time sync behaves weirdly. The clock in Esquire seems to ultimately adjust itself until the :30 or :00 mark, and then until the completion of the current grid, and that's with the current parameters. Yes your first up to hour of operation will be wrong, but its better than having it permanently off by an hour. I will review this again after the next DST changeover should nobody else file a bug report. Time is complicated, "who knew?"

## Stacks used:
[FS-UAE - Commodore Amiga Emulator](https://github.com/FrodeSolheim/fs-uae)

[PrevueCLI - Utility for converting between XMLTV and Prevue listing formats](https://github.com/AriX/PrevueCLI)

[ffmpeg - Video Toolkit](https://git.ffmpeg.org/gitweb/ffmpeg.git)

[Xorg](www.x.org)

[nginx](https://github.com/nginx/nginx)
