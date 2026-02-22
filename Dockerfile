FROM ubuntu:resolute

ENV DEBIAN_FRONTEND=noninteractive

# Install required system tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    openssh-client \
    sudo \
 && rm -rf /var/lib/apt/lists/*

# Create a non-root user

RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu \
 && chmod 0440 /etc/sudoers.d/ubuntu

USER 1000:1000 
WORKDIR /home/ubuntu

# Prepare SSH configuration
RUN mkdir -p /home/ubuntu/.ssh \
 && touch /home/ubuntu/.ssh/known_hosts

# Preload GitHub host keys (non-interactive Git usage)
RUN ssh-keyscan -T 5 github.com 2>/dev/null >> /home/ubuntu/.ssh/known_hosts || true

# Install OpenCode AI (official binary installer)
RUN curl -fsSL https://opencode.ai/install | bash
ENV PATH="/home/ubuntu/.opencode/bin:$PATH"