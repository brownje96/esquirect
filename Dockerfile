FROM debian:bookworm
RUN apt-get update -y; apt-get upgrade -y; apt dist-upgrade -y
RUN apt-get install anacron cron -y
RUN apt-get install curl xvfb fs-uae x11vnc ffmpeg nginx -y
WORKDIR /app
RUN curl -sLo /dev/stdout http://prevueguide.com/Tools/PrevuePackage/PrevueCLI-2.1.1-Linux.tar.gz | tar -xvzf - -C "/app"
COPY src/ /app
RUN mv /app/esq_upd /etc/cron.daily

# Make relevant changes to nginx.conf
RUN rm -r /etc/nginx/sites-enabled/*
RUN rm /etc/nginx/nginx.conf
RUN mv /app/nginx.conf /etc/nginx/nginx.conf


# Web Server port for HLS
EXPOSE 80

# VNC Server
EXPOSE 5901


ENV DISPLAY=:1
ENTRYPOINT ["bash", "go.sh"]
