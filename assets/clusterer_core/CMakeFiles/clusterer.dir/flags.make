# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# compile CUDA with /usr/local/cuda-12.6/bin/nvcc
CUDA_DEFINES = -DENABLE_INFO_LOGGING=1

CUDA_INCLUDES = --options-file CMakeFiles/clusterer.dir/includes_CUDA.rsp

CUDA_FLAGS =  -gencode=arch=compute_86,code=sm_86 -O3 -DNDEBUG -std=c++17 "--generate-code=arch=compute_86,code=[compute_86,sm_86]"

