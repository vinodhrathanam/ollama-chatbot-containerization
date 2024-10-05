# Base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    lsb-release \
    ca-certificates \
    gnupg \
    software-properties-common

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Create /app directory and set it as the working directory
RUN mkdir -p /app
WORKDIR /app

# Copy application code and docker-compose.yml into /app
COPY . /app
COPY ./docker-compose.yml /app/docker-compose.yml

# Make start.sh script executable
RUN chmod +x /app/start.sh

# Entrypoint script to run when the container starts
ENTRYPOINT ["/app/start.sh"]
