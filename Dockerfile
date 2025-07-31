FROM debian:bookworm
RUN apt-get update -y; apt-get upgrade -y; apt dist-upgrade -y
RUN apt-get install anacron cron -y
RUN apt-get install curl xvfb fs-uae x11vnc ffmpeg libnginx-mod-rtmp nginx -y
WORKDIR /app
RUN curl -sLo /dev/stdout http://prevueguide.com/Tools/PrevuePackage/PrevueCLI-2.1.1-Linux.tar.gz | tar -xvzf - -C "/app"
COPY src/ /app
RUN mv /app/esq_upd /etc/cron.daily
RUN sed -i 's/worker_processes auto/worker_processes 1/g' /etc/nginx/nginx.conf
RUN cat nginx-rtmp-cfg >> /etc/nginx/nginx.conf
RUN rm nginx-rtmp-cfg
EXPOSE 1935
EXPOSE 5901
ENV DISPLAY=:1
ENTRYPOINT ["bash", "go.sh"]
