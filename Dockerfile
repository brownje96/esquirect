# Install the userland
FROM debian:bookworm

#Set up the package manager
RUN apt-get update -y; apt-get upgrade -y; apt dist-upgrade -y

#Install Minimal Tools
RUN apt-get install anacron cron net-tools nano sudo procps curl -y

#Install X11 Virtual Framebuffer and X11 Tools
RUN apt-get install xvfb -y

#Install X11 Minimal Goodies
#RUN apt-get install x11-apps xterm -y

#Install FS-UAE (Commodore Amiga Emulator)
RUN apt-get install fs-uae -y

#Install VNC Server
RUN apt-get install x11vnc -y

#Install ffmpeg
RUN apt-get install ffmpeg -y

#Install nginx
RUN apt-get install libnginx-mod-rtmp nginx -y

WORKDIR /app

#Install PreVueCLI
RUN wget -q -O- http://prevueguide.com/Tools/PrevuePackage/PrevueCLI-2.1.1-Linux.tar.gz | tar -xvz -C "/app"

COPY src/ /app

RUN mv /app/esq_upd /etc/cron.hourly

#Forward Ports 5900 and 5901
EXPOSE 1935
EXPOSE 5900
EXPOSE 5901

#Environmental Variables

#Setup X11 Variables
ENV DISPLAY=:1

# Go.
ENTRYPOINT ["bash", "go.sh"]
