# Project Dev Environment

This repository is set up with a fully configured development container using Docker, Docker Compose, and VS Code’s Remote Containers extension. This environment provides a consistent setup for developing, training, and deploying our movie recommendation service.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- **Docker Desktop** (or an equivalent Docker Engine installation)  
  [Download Docker Desktop](https://www.docker.com/products/docker-desktop)
- **Visual Studio Code**  
  [Download VS Code](https://code.visualstudio.com/)
- **Remote - Containers Extension for VS Code**  
  Install from the VS Code Extensions marketplace
- **Git** (installed on your host machine)


## Project Structure

Your repository should have the following structure:

- **`.devcontainer.json`**: Tells VS Code how to build and connect to the container.
- **`.devcontainer/Dockerfile`**: Builds the custom image, installs dependencies.
- **`docker-compose.yml`**: Defines services (like our app container) and volumes.
- **`requirements.txt`**: Lists the Python packages required for our project.

## What you need to do to get up and running

Just follow these simple steps:

 ```bash
git clone https://github.com/DhwanilV/dev-container.git

cd dev-container
```

Now on the bottom left of the corner you should see a button with '><' looking logo, click on it.

Now select the option **`Reopen in container`** and boom! You should see the container get built and vscode will open a window inside the container.
