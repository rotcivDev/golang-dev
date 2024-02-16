#[Go Tutorial: Create a Go module] (https://go.dev/doc/tutorial/create-module)

This repository provides a Dockerized environment for Go tutorial practice

## Prerequisites

- [Docker](https://www.docker.com/) installed on your machine

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone -b tutorial/create-module https://github.com/rotcivDev/golang-dev.git &&
    cd golang-dev
    ```

2. Build the Docker image:

    ```bash
    docker compose build
    ```

3. Run the Docker container:

    ```bash
    docker compose run golang-dev
    ```

    This command will run the app create in the tutorial, including the test

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
