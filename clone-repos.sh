#!/bin/bash

echo "Starting repository setup script..."
echo "Checking for environment variables..."

# Debug: Print environment variables (careful with exposing PAT)
echo "GITHUB_USERNAME is ${GITHUB_USERNAME:+set}"
echo "GITHUB_PAT is ${GITHUB_PAT:+set}"
echo "GITHUB_REPOS: ${GITHUB_REPOS:-not set}"

echo "Setting up Git configuration..."
git config --global credential.helper store

# Set GitHub credentials for cloning
if [ -n "$GITHUB_USERNAME" ] && [ -n "$GITHUB_PAT" ]; then
  echo "https://$GITHUB_USERNAME:$GITHUB_PAT@github.com" > ~/.git-credentials
  git config --global user.name "$GITHUB_USERNAME"
  git config --global user.email "$GITHUB_USERNAME@users.noreply.github.com"
  echo "Git credentials configured."
else
  echo "Warning: GitHub credentials not provided in environment variables."
  echo "Set GITHUB_USERNAME and GITHUB_PAT in the .env file."
  exit 1
fi


mkdir -p /workspace
cd /workspace


gitURL="https://$GITHUB_USERNAME:$GITHUB_PAT@github.com/cmu-seai/group-project-s25-alien5.git"
repo=group-project-s25-alien5
if [[ -d "$repo" ]]; then
  echo "Repository $repo already exists. Removing for fresh clone"
  rm -rf "$repo"
fi
echo "Cloning $repo..."
git clone "$gitURL" || { echo "Failed to clone $repo"; exit 1; }

echo "Repository setup complete."

echo "Installing Python dependencies..."
pip install -r /workspace/group-project-s25-alien5/requirements.txt || { echo "Failed to install Python dependencies"; exit 1; }
echo "Python dependencies installed successfully."

echo "Creating .env file..."
cd /workspace/group-project-s25-alien5
./entrypoint.sh


