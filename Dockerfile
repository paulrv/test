FROM clearlinux:latest
RUN swupd bundle-add curl && curl -L https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-4.5.4_v2.0.9/x86_64-qbittorrent-nox -o /usr/bin/qbittorrent-nox && chmod +x qbittorrent-nox

# Define default command
ENTRYPOINT ["qbittorrent-nox --webui-port=8000"]

# Expose ports
EXPOSE 8000
