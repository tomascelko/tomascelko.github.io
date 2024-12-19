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

This project provides free access to source code for non-commercial puproposes on request. For access, do not hesitate to contact us.

For potential applications, improvements, ideas, bugs or questions please contact me by email either at celko(at)ksvi.mff.cuni.cz or at tomas.celko@cvut.cz, I will be happy to help.

## Supported hardware
Currently we support clustering Timepix3 and Timpiex4 hits in data-driven mode.
Support for frame-based mode and multiple-detector configurations is being implemented.

## CPU parallel clustering

Development in progress, TBD.

## GPU parallel clustering


### Requirements

Project targets Linux-based and Windows platforms. Since the implementation runs in CUDA, a CUDA-capable device is required to run the project.

Prerequisites to link against the prebuilt library (TBD):
- Linux or Windows x86/64 platform
- CUDA-capable device, compute capability >= 5.5
- NVidia GPU Computing Toolkit including nvcc >= 12.6
- CMake >= 3.20
- C++ compiler compatible with C++17 standard

### Installation

TBD

### API example:
```cpp
  // define function callback to receive clustered data
  auto output_callback = [](clustered_data<tpx3_hit> data)
  {
    std::cout << "Returned with " << data.size << " hits" << std::endl;
    std::cout << "First hit: " << data.x[0] << data.y[0] << data.toa[0] << data.tot[0] << data.label[0] << std::endl;
    /*process the data here in the callback, make a copy,....
      data.x, data.y, data.toa, data.tot
      //note: data.toa is uint64_t = 19 digits of precision - toa in nanoseconds or even smaller, controlled by parameter decimal digits 
    */
  }

  //initialize controller with arguments
  external_dataflow_controller<tpx3_hit> controller_tpx3(node_args::load_tpx3_args(/*pass algorithm parameters here*/), output_callback);
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
    <td><a href="/assets/clusterer_core/build_windows10/clusterer_core.zip" download="clusterer_core_win.zip">Download clusterer_core_win.zip</a></td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Other Unix-based system (archive)</td>
    <td><a href="/assets/clusterer_core/build_ubuntu2404/clusterer_core.zip" download="clusterer_core.zip">Download clusterer_core.zip</a></td>
    <td>TBD</td>

  </tr>
  <tr>
    <td>Ubuntu 22.04</td>
    <td><a href="/assets/clusterer_core/build_ubuntu2204/clusterer_core_amd64.deb" download="clusterer_core_ubuntu2204.deb">Download clusterer_core_ubuntu2204.deb</a></td>
    <td>TBD</td>

  </tr>
  <tr>
    <td>Ubuntu 24.04</td>
    <td><a href="/assets/clusterer_core/build_ubuntu2404/clusterer_core_amd64.deb" download="clusterer_core_ubuntu2404.deb">Download clusterer_core_ubuntu2404.deb</a></td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Debian 11</td>
    <td><a href="/assets/clusterer_core/build_debian11/clusterer_core_amd64.deb" download="clusterer_core_debian11.deb">Download clusterer_core_debian11.deb</a></td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Debian 12</td>
    <td><a href="/assets/clusterer_core/build_debian12/clusterer_core_amd64.deb" download="clusterer_core_debian12.deb">Download clusterer_core_debian12.deb</a></td>
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