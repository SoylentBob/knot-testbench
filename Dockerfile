FROM alpine:3.8

EXPOSE 8053/tcp 8053/udp

VOLUME ["/etc/knot", "/var/lib/knot/zones", "/run/knot"]

RUN apk -U upgrade && \
    apk add --no-cache knot inotify-tools tini && \
    rm -rf /var/cache/apk/*

COPY scripts/docker-entrypoint.sh /usr/bin/docker-entrypoint
COPY scripts/watch-knot-config.sh /usr/bin/watch-knot-config
COPY scripts/watch-zonefiles.sh /usr/bin/watch-zonefiles

RUN chmod +x /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/watch-knot-config
RUN chmod +x /usr/bin/watch-zonefiles

RUN mkdir -p /home/knot/
RUN chown -c knot /home/knot

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "/usr/bin/docker-entrypoint"]
