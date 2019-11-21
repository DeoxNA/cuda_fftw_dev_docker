# A simple Docker development environment with NVCC and FFTW
FROM ubuntu:18.04
MAINTAINER dhna

# Install the NVCC compiler and CUDA libraries
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y wget gnupg ca-certificates && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin && \
    mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub && \
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y cuda-compiler-10-2 cuda-libraries-dev-10-2 && \
    apt-get --purge remove -y wget gnupg ca-certificates && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

# Expose NVCC binary
ENV PATH="${PATH}:/usr/local/cuda-10.2/bin"

# Install the FFTW, cmake, and other utilities
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y make cmake gcc g++ libfftw3-dev && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*
