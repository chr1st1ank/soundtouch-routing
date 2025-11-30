FROM traefik:v3

COPY traefik-config.yaml /etc/traefik/dynamic.yml

ENTRYPOINT ["traefik"]
CMD ["--providers.docker=false", \
     "--entrypoints.port8080.address=:8080", \
     "--entrypoints.port8090.address=:8090", \
     "--log.level=INFO", \
     "--providers.file.filename=/etc/traefik/dynamic.yml"]

LABEL org.opencontainers.image.title="SoundTouch Proxy"
LABEL org.opencontainers.image.description="A minimal image to proxy SoundTouch devices"
LABEL org.opencontainers.image.source="https://github.com/chr1st1ank/soundtouch-routing"
LABEL org.opencontainers.image.url="https://github.com/chr1st1ank/soundtouch-routing/pkgs/container/soundtouch-routing"