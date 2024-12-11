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
# Clustering Library

## Clustering library API example:
```
  auto output_callback = [](clustered_data<tpx3_hit> data)
  {
    std::cout << "Returned with " << data.size << " hits" << std::endl;
    std::cout << "First hit: " << data.x[0] << data.y[0] << data.toa[0] << data.tot[0] << data.label[0] << std::endl;
    /*process the data here in the callback, make a copy,....
      data.x, data.y, data.toa, data.tot
      //note: data.toa is uint64_t = 19 digits of precision - toa in nanoseconds or even smaller, controlled by parameter decimal digits 
    */
  }

  external_dataflow_controller<tpx3_hit> controller_tpx3(node_args::load_tpx3_args(/*pass algorithm parameters here*/), output_callback);  
  controller_tpx3.run();
  external_stream_data_reader<tpx3_hit>* reader = controller_tpx3.input();
  reader->process_hit(0 /*pixel_idx*/, 2 /*coarse toa*/, 3 /*fine toa*/, 4/*tot*/);
  ...
  controller_tpx3.close();

```
<table>
  <tr>
    <th>OS</th>
    <th>Prebuilt Static Library</th>
    <th>Prebuilt Dynamic Library</th>
  </tr>
  <tr>
    <td>Windows</td>
    <td>TBD</td>
    <td>TBD</td>
  </tr>
  <tr>
    <td>Linux</td>
    <td><a href="/assets/clusterer_core/static_lib.zip" download="static_clusterer_core_ubuntu2204.zip">Download static_clusterer_core_ubuntu22_04_{{latest_version}}.zip</a></td>
    <td>TBD</td>
  </tr>
</table>

Below you can find a few relaxing, unrelated images.
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

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above: