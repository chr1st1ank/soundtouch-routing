# soundtouch-routing

Proxy setup for reaching Bose SoundTouch devices in a local network from a different subnet.

## Quick Start

Run the pre-built Docker image on any machine that is in the same subnet as your SoundTouch device.

**Required:** Set the `SOUNDTOUCH_HOST` environment variable to your device's IP address:

```bash
docker run -d -p 8080:8080 -p 8090:8090 \
  -e SOUNDTOUCH_HOST=192.168.5.203 \
  --name soundtouch-proxy \
  --restart unless-stopped \
  ghcr.io/chr1st1ank/soundtouch-routing:latest
```

The proxy will be available on ports 8080 and 8090 and behave like the SoundTouch device itself.

### Finding Your SoundTouch Device IP

You can find your device's IP address in the SoundTouch app under Settings → About, or use network scanning tools like `nmap`:

```bash
nmap -p 8090 192.168.1.0/24
```

## Alternative: Using Docker Compose

If you prefer docker-compose:

1. Clone this repository
2. Edit `docker-compose.yaml` and set the `SOUNDTOUCH_HOST` environment variable to your device's IP
3. Run:

```bash
docker compose up -d
```

The docker-compose setup will build the image locally and use the same environment variable configuration as the pre-built image.

## Development

### Project Structure

```text
soundtouch-routing/
├── docker/              # Docker image configuration
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── traefik-config.yaml
├── tests/               # Test scripts for local development
│   ├── soundtouch_test.py
│   └── soundtouch_websocket_test.py
├── docker-compose.yaml  # Compose configuration
└── README.md
```

### Testing

Python test scripts are available in the `tests/` folder to validate the proxy functionality. 
These require the `libsoundtouch` library (see `pyproject.toml` for dependencies).
To install everything and run the tests, best use uv, e.g.:

```bash
uv sync
uv run python tests/soundtouch_test.py
```
