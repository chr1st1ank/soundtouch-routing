FROM traefik:v3

# Install envsubst for environment variable substitution
RUN apk add --no-cache gettext

# Copy config template and entrypoint script
COPY traefik-config.yaml /etc/traefik/dynamic.yml.template
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["--providers.docker=false", \
     "--entrypoints.port8080.address=:8080", \
     "--entrypoints.port8090.address=:8090", \
     "--log.level=INFO", \
     "--providers.file.filename=/etc/traefik/dynamic.yml"]

LABEL org.opencontainers.image.title="SoundTouch Proxy"
LABEL org.opencontainers.image.description="A minimal image to proxy SoundTouch devices"
LABEL org.opencontainers.image.source="https://github.com/chr1st1ank/soundtouch-routing"
LABEL org.opencontainers.image.url="https://github.com/chr1st1ank/soundtouch-routing/pkgs/container/soundtouch-routing"
LABEL org.opencontainers.image.licenses="Apache-2.0"