# Use a stable Ubuntu LTS image as a base
FROM ubuntu:22.04

# Set non-interactive mode to prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Combine all setup and installation steps into a single RUN command
# This reduces the number of image layers and optimizes the build process.
RUN apt-get update && \
    # 1. Install initial dependencies for adding new repositories
    apt-get install -y --no-install-recommends \
        curl \
        gnupg \
        ca-certificates \
        apt-transport-https && \
    \
    # 2. Add the Google Cloud SDK repository for gsutil
    curl -sS https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/google-cloud-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/google-cloud-key.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    \
    # 3. Add the ClickHouse repository
    curl -fsSL 'https://packages.clickhouse.com/rpm/lts/repodata/repomd.xml.key' | gpg --dearmor -o /usr/share/keyrings/clickhouse-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/clickhouse-key.gpg] https://packages.clickhouse.com/deb lts main" > /etc/apt/sources.list.d/clickhouse.list && \
    \
    # 4. Update package list again with the new repositories and install the tools
    apt-get update && \
    apt-get install -y --no-install-recommends \
        google-cloud-sdk \
        clickhouse-client && \
    \
    # 5. Clean up to minimize the final image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the default command to start an interactive bash shell
# This allows you to use gsutil and clickhouse-client directly
CMD ["/bin/bash"]