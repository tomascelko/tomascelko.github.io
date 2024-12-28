---
layout: page
title: Parallel clustering library
description: Fast connected component analysis for hybrid pixel detectors
img: assets/img/logo_parallel_clustering.jpeg
importance: 1
category: work
related_publications: true
latest_version: 0_0_1
---
## About

This project implements a parallel clustering libraries for CPU and GPU intended for hybrid pixel detectors. By clustering, we mean connected-component analysis with respect to spatial and temporal pixel coordinates. Namely, it implements algorithms described <a href="https://arxiv.org/abs/2412.11809"> here </a> also published by JINST Journal.  

This project provides free access to source code for non-commercial puproposes on request. For access, do not hesitate to contact us. We kindly ask the users to cite the corresponding article [TBD], should any of the described parallel clustering method be applied in your work. 

For potential applications, improvements, ideas, bugs or questions please contact me by email either at celko(at)ksvi.mff.cuni.cz or at tomas.celko(at)cvut.cz, I will be happy to help.

## Supported hardware
Currently we support clustering Timepix3 and Timpiex4 hits in data-driven mode.
Support for frame-based mode and multiple-detector configurations is being implemented.
Support for other similar detectors or modes is a matter of demand, feel free to let us know about possible applications.


## News

19.12 - We are currently working on finalizing the package for the first (alpha) release of the GPU package. 
26.12 - Baseline testing of all prebuilt libraries has passed, continuing with parameter testing
28.12 - Extended documentation,  

## CPU parallel clustering

We implemented CPU-based parallel clustering as a part of the <a href="https://software.utef.cvut.cz/tracklab/"> Tracklab</a> software, where it can be used.

Development of the standalone package is in progress.

## GPU parallel clustering


### Requirements

Project targets Linux-based and Windows platforms. Since the implementation runs in CUDA, a CUDA-capable device is required to run the project.

Prerequisites to link against the prebuilt library (TBD):
- Linux or Windows x86/64 platform
- CUDA-capable device, compute capability >= 5.5
- NVidia GPU Computing Toolkit >= 12.6 (and a compatible nvidia driver, check with `nvidia-smi` command)
- CMake >= 3.19
- C++ compiler compatible with C++17 standard

### Installation
We provide user multiple options how to install our library:

#### 1.From installer file (.deb) - recommended
- download suitable installer file
- (optional) for .deb file, check the Lintian output, make sure there are no errors
- make sure all prerequisites are matched - this is not hard-checked by the package
- run the installer

#### 2.From prebuilt .zip package
- download suitable version for your platform from the table below
- extract the zip file to desired location. For linux, you may want to copy contents of the `include` folder to `usr/include/` and contents of `lib` folder to `/usr/lib/`. For Windows, you may want to copy contents of the extracted `clusterer_cuda` folder to `C:/Program Files` and let cmake know about path to `clusterer_cuda-config.cmake`. The next step might not be required if the files were placed in standard locations like `/usr/lib`  
- letting cmake know about path to `clusterer_cuda-config.cmake` -  either set `CMAKE_PREFIX_PATH` to directory where `clusterer_cuda-config.cmake` is located or add it to environmental `PATH` variable.


#### 3.From source
- Request access to the repository by email - free for non-commercial applications 
- Create a build folder and generate build files with `cmake ..` or similar
- Build with `cmake --build . --config=Release`
- Similarily to option 2 ("From prebuilt .zip package"), let cmake know the path to `clusterer_cuda-config.cmake` file

If you struggle with installation, feel free to reach out by email.

### Linking

- ## Use `find_package` from your cmakelists

We consider this to be the most convenient option. Based on the value of `CLUSTERER_CUDA_USE_STATIC` variable, the `clusterer_cuda-config.cmake` sets the variables `CLUSTERER_CUDA_INCLUDE_DIR` and `CLUSTERER_CUDA_LIBRARY`. An example part of cmake script can be found below:
```cmake 
set(CMAKE_BINARY_DIR "${CMAKE_CURRENT_LIST_DIR}/build/Release")
set(CLUSTERER_CUDA_USE_STATIC ON)  # for static/dynamic linking
find_package(clusterer_cuda REQUIRED)
message(THESE_VARIABLES_ARE_INITIALIZED ${CLUSTERER_CUDA_FOUND} ${CLUSTERER_CUDA_INCLUDE_DIR} ${CLUSTERER_CUDA_LIBRARY})
add_executable(clusterer_test "src/main.cpp")
target_include_directories(clusterer_test PRIVATE ${CLUSTERER_CUDA_INCLUDE_DIR})
target_link_libraries(clusterer_test PRIVATE 
    ${CLUSTERER_CUDA_LIBRARY} 
    CUDA::cudart_static # choose either cudart_static and cudart
    CUDA::nvrtc      
)
```
- ## Set include and library paths manually

Another option is to bypass cmake `find_package` completely and set `CLUSTERER_CUDA_INCLUDE_DIR` and `CLUSTERER_CUDA_LIBRARY` manually. This is also the case for non-cmake-based projects, like the ones in Visual Studio. In Visual Studio, go to `Configuration Properties > C/C++ > General` and set `Additional Include Directories`, and similarly for `Configuration Properties > Linker > General` set `Additional Library Directories`.

### API example:
```cpp
  // define function callback to receive clustered data
  auto output_callback = [](clustered_data<tpx3_hit> data)
  {
    std::cout << "Returned with " << data.size << " hits" << std::endl;
    std::cout << "First hit: " << data.x[0] << data.y[0] << data.toa[0] << data.tot[0] << data.label[0] << std::endl;
    /*process the data here in the callback, make a copy, as the data pointers might not be valid after callback returns...
      data.x, data.y, data.toa, data.tot
      //note: data.toa is uint64_t = 19 digits of precision - toa in nanoseconds or even smaller, controlled by parameter decimal digits 
    */
  }

  //initialize controller with arguments
  external_dataflow_controller<tpx3_hit> controller_tpx3(node_args::load_tpx3_args(/*pass algorithm parameters here in a config file*/ "config.txt"), output_callback);
  //run the controller, after that we are ready to receive data  
  controller_tpx3.run();
  //store reference to reader node
  external_stream_data_reader<tpx3_hit>* reader = controller_tpx3.input();
  //process hits in a loop, example
  reader->process_hit(0 /*pixel_idx*/, 2 /*coarse toa*/, 3 /*fine toa*/, 4/*tot*/);
  //after sufficient amount of hits is processed, the callback is called
  ...
  //stop the dataflow, and flush not-yet processed hits for and call callback for the last time
  controller_tpx3.close();

```
### Prebuilt library available for download:
<table>
  <tr>
    <th>Platform</th>
    <th>GPU Library, prebuilt (Latest)</th>
    <th>GPU Library, prebuilt (Stable)</th>
    
  </tr>
  <tr>
    <td>Windows</td>
    <td><a href="/assets/clusterer_cuda/build_windows10/clusterer_cuda.zip" download="clusterer_cuda_win.zip">Download clusterer_cuda_win.zip</a></td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Other Unix-based system (archive)</td>
    <td><a href="/assets/clusterer_cuda/build_ubuntu2404/clusterer_cuda.zip" download="clusterer_cuda.zip">Download clusterer_cuda.zip</a></td>
    <td>TBD</td>

  </tr>
  <tr>
    <td>Ubuntu 22.04</td>
    <td><a href="/assets/clusterer_cuda/build_ubuntu2204/clusterer_cuda_x64.deb" download="clusterer_cuda_ubuntu2204.deb">Download clusterer_cuda_ubuntu2204.deb</a></td>
    <td>TBD</td>

  </tr>
  <tr>
    <td>Ubuntu 24.04</td>
    <td><a href="/assets/clusterer_cuda/build_ubuntu2404/clusterer_cuda_x64.deb" download="clusterer_cuda_ubuntu2404.deb">Download clusterer_cuda_ubuntu2404.deb</a></td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Debian 11</td>
    <td><a href="/assets/clusterer_cuda/build_debian11/clusterer_cuda_x64.deb" download="clusterer_cuda_debian11.deb">Download clusterer_cuda_debian11.deb</a></td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Debian 12</td>
    <td><a href="/assets/clusterer_cuda/build_debian12/clusterer_cuda_x64.deb" download="clusterer_cuda_debian12.deb">Download clusterer_cuda_debian12.deb</a></td>
    <td>TBD</td>
  </tr>

</table>

Below you can find a few relaxing and project-unrelated images.
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/1.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/3.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>