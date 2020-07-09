# cuda_fftw_docker
A slim Docker image for building and testing CUDA applications that use the FFTW.

The following packages are included:
- nvcc compiler
- CUDA development libraries
    - CUDA runtime
    - cufft
    - curand
- fftw3
- cmake

## DockerHub

The image is available in [DockerHub](https://hub.docker.com/r/dhna/cuda_fftw).

## References

Refer to the [FFTW website](http://www.fftw.org/) for more information on the library. 
