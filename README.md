# docker-opencode

Simple Ubuntu Docker image with opencode.ai. All credentials are kept on the host.

## Prerequisites

- Docker installed

## Initial Setup

1. Install Docker if not already installed - see [Docker docs](https://docs.docker.com/get-docker/)

2. Build the Docker image:
   ```bash
   ./build.sh
   ```

3. Ensure the required host directories exist for credentials/config:
   ```bash
   mkdir -p ~/.local/share/opencode ~/.local/state/opencode ~/.config/opencode ~/opencode
   ```

4. Run opencode:
   ```bash
   ./run_opencode_docker.sh   # Linux
   .\run_opencode_docker.ps1  # Windows
   ```

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
./run_opencode_docker.sh
```

**Windows (PowerShell):**
```powershell
.\run_opencode_docker.ps1
```

## Volume Mounts

Credentials and configuration persist on the host at:
- `~/.local/share/opencode`
- `~/.local/state/opencode`
- `~/.config/opencode`
- `~/opencode`

## Notes

This project containerizes the running of opencode.ai while keeping all credentials and configuration on the host machine.

The container is run with the `--rm` flag, which automatically removes the container after it exits. This means no Docker container persists with the mounted volumes, keeping your host system clean. Each time you run opencode, a fresh container is created.

**Usage:**
1. Change to the project directory where you want to run opencode
2. Run the script:
   - Linux: `./run_opencode_docker.sh`
   - Windows: `.\run_opencode_docker.ps1`

**Tip:** Add the run script to a directory in your PATH (e.g., `~/bin` or create a `~/scripts` folder) so you can run opencode from any directory without navigating to this project folder first.
