# passim-docker
This repository provides a convenient way to use the [_passim_](https://github.com/dasmiq/passim "null") text reuse detection tool within a self-contained Docker environment. This allows you to run `passim` on any system with Docker installed, without needing to manage its dependencies directly.

### Key Features
- **Isolated Environment:** Run `passim` without worrying about local dependencies or conflicts.
- **Simple Usage:** The Docker container is designed to be used just like the native `passim` executable.
- **Cross-Platform:** Works seamlessly on Linux, macOS, and Windows.

### Quick Start
To get up and running with `passim` using this image, follow these steps:

1. Clone the Repository
    Start by cloning this repository to your local machine:
    
    ```
    git clone https://github.com/thomjur/passim-docker.git
    cd passim-docker
    ```
    
2. Prepare Your Data Directories
    You need to create local directories to hold your input files and receive the output. The Docker container will use these directories to access your data.
    
    ```
    mkdir -p input output
    ```
    
    To ensure the Docker container can read and write to these folders, you should grant the necessary permissions. The simplest way is to give them full read, write, and execute permissions.
    ```
    chmod 777 input output
    ```
    
3. Build the Docker Image
    Next, build the Docker image using the provided docker compose file. This only needs to be done once.
    
    ```
    docker compose build
    ```
    
4. Run passim
    You can now run passim by using the docker compose run command, passing in your desired arguments and paths. The container will automatically use the input and output folders you created.
    
    For example, to run `passim` on `my-input.json` and save the results to the `output` directory:
    
    ```
    docker compose run --rm passim input/my-input.json output
    ```
    
    - The `--rm` flag automatically removes the container after it exits, keeping your system clean.
    - The `passim` argument is the service name defined in `docker-compose.yml`.
        

### Changelog

#### Version 1.0.0

- Initial release.
