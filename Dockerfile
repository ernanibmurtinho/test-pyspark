FROM ubuntu:latest
LABEL maintainer="ernanibmurtinho"

# Install OpenJDK 8
RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-add-repository universe && apt-get update && apt-get install -y \
    software-properties-common \
    python \
    python-dev && \
    rm -rf /var/lib/apt/lists/*

# Install PySpark
RUN \
    pip install --upgrade pip && \
    pip install pyspark

# Define working directory
WORKDIR /data

# Define default command
CMD ["bash"]
