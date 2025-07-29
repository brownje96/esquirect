# esquirect
A container for running and streaming Esquire
## What is Esquire?
An electronic program guide from the 1990s, written for the Commodore Amiga, which presumably was ran at local cable TV headends.
## Usage:
Environmental Variables:


|Variable|Mandatory|Description|
|--------|---------|-----------|
|VNC_PASSWD|✅|Password to access the environment|
|XMLTV_LOCATION|✅|A URL to a valid XMLTV file|

## Components you will need
You must acquire a disk image of UVG Esquire, and the Amiga KickStart 2.04 BIOS ROM. I cannot help you with this.

## Running
At this point in time- you will have to build the container yourself. A script is included, as well as a Docker Compose file. It's relatively painless, but in short-

```
./build.sh
docker compose up -d
```


## Stacks used:
[FS-UAE - Commodore Amiga Emulator](https://github.com/FrodeSolheim/fs-uae)

[PrevueCLI - Utility for converting between XMLTV and Prevue listing formats](https://github.com/AriX/PrevueCLI)

[ffmpeg - Video Toolkit](https://git.ffmpeg.org/gitweb/ffmpeg.git)

[Xorg](www.x.org)

