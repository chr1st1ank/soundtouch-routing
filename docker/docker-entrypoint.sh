#!/bin/sh
set -e

if [ -z "${SOUNDTOUCH_HOST}" ]; then
  echo "ERROR: SOUNDTOUCH_HOST environment variable is required but not set."
  echo "Please provide the IP address of your SoundTouch device:"
  echo ""
  echo "  docker run -e SOUNDTOUCH_HOST=192.168.x.x ..."
  echo ""
  exit 1
fi

echo "Configuring proxy for SoundTouch device at: ${SOUNDTOUCH_HOST}"
envsubst '${SOUNDTOUCH_HOST}' < /etc/traefik/dynamic.yml.template > /etc/traefik/dynamic.yml

exec traefik "$@"
