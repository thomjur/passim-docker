FROM ubuntu:24.04

# Set environment variable to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install all dependencies in a single RUN command to reduce the number of layers
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        openjdk-17-jdk \
        python3.12 \
        python3.12-venv \
        pip && \
    # Clean up the apt-cache to reduce image size
    rm -rf /var/lib/apt/lists/*

# Define a clean path for the virtual environment
ENV VENV_PATH=/opt/venv

# Create the virtual environment directly in the defined path
RUN python3.12 -m venv ${VENV_PATH}

# Add the venv's 'bin' directory to the system PATH.
# This ENV instruction applies to all subsequent commands and the running container.
ENV PATH="${VENV_PATH}/bin:${PATH}"

# Install the Python packages. 'pip' now refers to the pip inside the venv.
# Upgrading pip and installing setuptools/wheel is often good practice.
RUN pip install --upgrade pip setuptools wheel
# ISSUE: as of 2025-08-19 pyspark 4.X was installed and caused trouble
# see also: https://github.com/dasmiq/passim/pull/18/commits/71ef9906180623627976c8739d21880ee086a2d1
RUN pip install pyspark==3.5.1
RUN pip install git+https://github.com/dasmiq/passim.git

# Set the working directory
WORKDIR /app

ENTRYPOINT ["passim"]
