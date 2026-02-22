# docker-opencode

Simple Ubuntu Docker image with opencode.ai. All credentials are kept on the host.

## Prerequisites

- Docker installed
- For Windows: WSL installed

## Build

```bash
./build.sh
```

Or:

```bash
docker build -t opencode-ai:latest .
```

## Usage

**Linux:**
```bash
./run.sh
```

**Windows (WSL):**
```bash
./run.sh
```

## Volume Mounts

Credentials and configuration persist on the host at:
- `~/.local/share/opencode`
- `~/.local/state/opencode`
- `~/.config/opencode`
- `~/opencode`
