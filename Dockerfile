FROM mcr.microsoft.com/vscode/devcontainers/python:3.10
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl 

WORKDIR /workspace
COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt