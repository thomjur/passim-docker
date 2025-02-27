FROM ubuntu:latest

# Aktualisieren der Paketlisten und installieren von Java und Python 3
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git openjdk-17-jdk python3.12 pip python3.12-venv && \
    apt-get clean

# Create folder for env
RUN mkdir ~/environments

# Creating a Python env
RUN python3.12 -m venv ~/environments/passim-env
# Setuptools is needed, otherwise we get an distutils missing error
RUN ~/environments/passim-env/bin/pip install
git+https://github.com/dasmiq/passim.git setuptools

# Add passim to .bashrc
RUN echo 'export PATH=$PATH:~/environments/passim-env/lib/site-packages/passim' >> ~/.bashrc

# Arbeitsverzeichnis setzen (optional)
WORKDIR /app

# Standardbefehl (optional, je nach Anwendungsfall)
CMD ["tail", "-f", "/dev/null"]
