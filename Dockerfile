# A simple Docker development environment with CUDA and FFTW
FROM nvidia/cuda:latest
MAINTAINER dhna

RUN apt-get update && \
    apt-get install -y autoconf automake make cmake gcc g++ git pkg-config wget libfftw3-dev && \
    apt-get clean all

RUN /sbin/ldconfig
