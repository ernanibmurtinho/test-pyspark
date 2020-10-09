FROM ubuntu:latest
LABEL maintainer="ernanibmurtinho"

# Install OpenJDK 8
RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-get update && apt-get install -y python2 curl && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python2 get-pip.py && \
    apt-get install -y \
    software-properties-common \
    python \
    python-dev && \
    #remove the contents of the directory above to refresh the package lists
    rm -rf /var/lib/apt/lists/*

# Install PySpark
RUN \
    pip install --upgrade pip && \
    pip install pyspark

# Define working directory
# Creating the file that will store the datasets
WORKDIR /data/Datasets

# Define default command
CMD ["bash"]
