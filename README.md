# soundtouch-routing

Proxy setup for reaching Bose SoundTouch devices in a local network from a different Subnet.

## Usage

In order to set the proxy up, you only need the `docker-compose.yaml` and the `traefik-config.yaml` files.

After that, you can start the proxy with `docker compose up` on any machine that is in the same subnet as the SoundTouch device.

The proxy will be available on port 8080 and 8090 and behave like the SoundTouch device itself.
