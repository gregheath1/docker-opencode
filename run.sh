#!/bin/bash

docker run --rm -it \
  -v "$HOME/.local/share/opencode:/home/ubuntu/.local/share/opencode" \
  -v "$HOME/.local/state/opencode:/home/ubuntu/.local/state/opencode" \
  -v "$HOME/.config/opencode:/home/ubuntu/.config/opencode" \
  -v "$HOME/opencode:/home/ubuntu/opencode" \
  -v "$PWD:/workspace" \
  -w /workspace \
  opencode-ai:latest \
  opencode
#bash
  
# ls /home/ubuntu/.local/share/opencode/log/ -al