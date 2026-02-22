$volumes = @(
  "$env:USERPROFILE\.local\share\opencode",
  "$env:USERPROFILE\.local\state\opencode",
  "$env:USERPROFILE\.config\opencode",
  "$env:USERPROFILE\opencode"
)

foreach ($vol in $volumes) {
  if (-not (Test-Path $vol)) {
    New-Item -ItemType Directory -Path $vol | Out-Null
  }
}

docker run --rm -it `
  -v "$env:USERPROFILE\.local\share\opencode:/home/ubuntu/.local/share/opencode" `
  -v "$env:USERPROFILE\.local\state\opencode:/home/ubuntu/.local/state/opencode" `
  -v "$env:USERPROFILE\.config\opencode:/home/ubuntu/.config/opencode" `
  -v "$env:USERPROFILE\opencode:/home/ubuntu/opencode" `
  -v "$PWD:/workspace" `
  -w /workspace `
  opencode-ai:latest `
  opencode
