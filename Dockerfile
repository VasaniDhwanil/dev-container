FROM mcr.microsoft.com/vscode/devcontainers/python:3.10
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    sudo

RUN mkdir /workspace && useradd -m -s /bin/bash alien && \
    echo "alien ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R alien:alien /workspace
USER alien
WORKDIR /workspace

COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt