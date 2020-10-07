FROM ubuntu:latest
LABEL maintainer="ernanibmurtinho"

# Install OpenJDK 8
RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  rm -rf /var/lib/apt/lists/*

# Install Python
RUN \
    apt-get install software-properties-common && \
    apt-add-repository universe && \
    apt-get update && \
    apt-get install python-pip && \
    apt-get install -y python python-dev python-virtualenv && \
    rm -rf /var/lib/apt/lists/*

# Install PySpark
RUN \
    pip install --upgrade pip && \
    pip install pyspark

# Define working directory
WORKDIR /data

# Define default command
CMD ["bash"]
