# A simple Docker development environment with NVCC and FFTW
FROM ubuntu:20.04
MAINTAINER dhna

# Install the NVCC compiler and CUDA libraries
ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=America/Denver
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y \
        wget gnupg ca-certificates && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin && \
    mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub && \
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y \
        cuda-compiler-11-0 cuda-libraries-dev-11-0 && \
    apt-get --purge remove -y wget gnupg ca-certificates && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

# Expose CUDA binaries
ENV PATH="${PATH}:/usr/local/cuda-11.0/bin"

# Install the FFTW, cmake, and other utilities
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y \
        make cmake gcc g++ libfftw3-dev && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*
