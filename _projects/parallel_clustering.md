---
layout: page
title: Parallel clustering library
description: with background image
img: assets/img/logo_parallel_clustering.jpeg
importance: 1
category: work
related_publications: true
---

TBD some text describing the library

## Clustering library API example:
```
  auto output_callback = [](clustered_data<tpx3_hit> data)
  {
    std::cout << "Returned with " << data.size << " hits" << std::endl;
    std::cout << "First hit x" << data.x[0] << data.y[0] << data.toa << data.tot << data.label << std::endl;
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
    <a href="/assets/clusterer_core/static_lib.zip" download="static_clusterer_core_ubuntu2204.zip">Download static_clusterer_core_ubuntu2204.zip</a>
    <td><a href="https://example.com/dynamic-library">Download Dynamic Lib</a></td>
  </tr>
  <tr>
    <td>Linux</td>
    <td><a href="https://example.com/static-library-linux">Download Static Lib</a></td>
    <td><a href="https://example.com/dynamic-library-linux">Download Dynamic Lib</a></td>
  </tr>
</table>


Every project has a beautiful feature showcase page.
It's easy to include images in a flexible 3-column grid format.
Make your photos 1/3, 2/3, or full width.

To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: project
    description: a project with a background image
    img: /assets/img/12.jpg
    ---

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
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images, even citations {% cite einstein1950meaning %}.
Say you wanted to write a bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, _bled_ for your project, and then... you reveal its glory in the next row of images.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above:

{% raw %}

```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

{% endraw %}
