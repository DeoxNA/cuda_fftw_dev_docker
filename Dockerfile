# A simple Docker development environment with CUDA and FFTW
FROM nvidia/cuda:latest
MAINTAINER dhna

RUN apt-get update && \
    apt-get install --no-install-recommends -y autoconf automake make cmake gcc g++ libfftw3-dev && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

RUN /sbin/ldconfig
