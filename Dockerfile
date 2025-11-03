
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    bash \
    netcat-openbsd \
    curl \
    fortune-mod \
    cowsay \
    && rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH (where cowsay and fortune live)
ENV PATH="$PATH:/usr/games"

WORKDIR /app

COPY server.sh .

RUN chmod +x server.sh

EXPOSE 4499

# --- Healthcheck section ---
# Syntax:
# HEALTHCHECK [OPTIONS] CMD command
# Options:
#   --interval=DURATION (default: 30s)
#   --timeout=DURATION (default: 30s)
#   --start-period=DURATION (default: 0s)
#   --retries=N (default: 3)
#
# This will check every 30s if the port 4499 is open and responding.

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD nc -z localhost 4499 || exit 1

# Alternatively, if your server gives HTTP response, use:
# HEALTHCHECK CMD curl -f http://localhost:4499/health || exit 1

CMD ["./server.sh"]
