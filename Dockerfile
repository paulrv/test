FROM clearlinux:latest
RUN swupd bundle-add curl && curl -L https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-4.5.4_v2.0.9/x86_64-qbittorrent-nox -o /usr/bin/qbittorrent-nox && chmod +x /usr/bin/qbittorrent-nox
RUN mkdir -p /config/qBittorrent/config /download \
    && touch /config/qBittorrent/config/qBittorrent.conf \
    && echo "[BitTorrent]" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Session\DefaultSavePath=/downloads" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Session\Port=6881"  >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Session\TempPath=/downloads/temp" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo " " >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "[LegalNotice]" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Accepted=true" >> /config/qBittorrent/config/qBittorrent.conf \
    && chgrp -R 0 /config /download && chmod -R g+rwX /config /download

# Define default command
ENTRYPOINT ["/usr/bin/qbittorrent-nox --profile=/config --webui-port=8000"]

# Expose ports
EXPOSE 8000 
EXPOSE 6881/tcp
EXPOSE 6881/udp
