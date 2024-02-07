# Go Development Environment with Docker

This repository provides a Dockerized development environment for Go, including the official Go image, Vim, and Bash. It's a convenient way to set up a consistent and isolated development environment for your Go projects.

## Prerequisites

- [Docker](https://www.docker.com/) installed on your machine

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone git@github.com:rotcivDev/golang-dev.git
    cd golang-dev
    ```

2. Build the Docker image:

    ```bash
    docker-compose build
    ```

3. Run the Docker container:

    ```bash
    docker-compose run golang-dev
    ```

    This command will drop you into a Bash shell inside the container.

## Development

- Your local project directory is mounted into the `/go/src/app` directory inside the container. Any changes made locally will be reflected inside the container, allowing for seamless development.

- Use Vim for editing your Go code, and run your Go commands directly in the container.

## Customization

If you need additional tools or specific configurations, feel free to modify the Dockerfile and docker-compose.yml according to your requirements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
