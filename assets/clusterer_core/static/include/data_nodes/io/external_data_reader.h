#pragma once
#include "data_flow/i_data_node.h"
#include "utils.h"
#include "data_structs/cuda_hit_buffer.cuh"
#include "data_nodes/nodes_package.h"
#include <fstream>
#include <iostream>
#include <memory>
#include <vector>
#include <functional>
#include "data_structs/tpx3_hit.h"
#include "data_structs/tpx4_hit.h"

#include "devices/timepix4.h"

namespace clustering
{
  using namespace std::chrono_literals;
  enum class buffer_outputting_type
  {
    SINGLE_CONSUMER_SINGLE_STREAM,
    SINGLE_CONSUMER_MULTI_STREAM,
    MULTI_CONSUMER_SINGLE_STREAM
  };
  /*template <typename hit_type>
  class external_dataflow_controller;
*/
  namespace SoAClusteringType = SoAClustering;
  // a node which reads the data from a stream using >> operator
  template <typename hit_type>
  class external_stream_data_reader : public i_data_node
  {
    friend class external_dataflow_controller<hit_type>;
    using host_data_type = typename SoAClusteringType::host_data<hit_type>;
  
  //API
  public:
    template <typename H = hit_type>
    std::enable_if_t<std::is_same<H, tpx3_hit>::value, void>  process_hit(typename tpx3_hit::coord_type coord,
                      typename tpx3_hit::ctoa_type ctoa,
                      typename tpx3_hit::ftoa_type ftoa,
                      typename tpx3_hit::tot_type tot)
    {
    process_hit_impl(tpx3_hit(coord, ctoa, ftoa, tot));
    }

  template <typename H = hit_type>
  std::enable_if_t<std::is_same<H, tpx4_hit>::value, void>  process_hit(typename tpx4_hit::coord_type coord,
                      typename tpx4_hit::ctoa_type ctoa,
                      typename tpx4_hit::ftoa_type ftoa,
                      typename tpx4_hit::uftoa_type uftoa,
                      typename tpx4_hit::tot_type tot)
    {
    process_hit_impl(tpx4_hit(coord, ctoa, ftoa, uftoa, tot));
    }
    /*void process_hit(typename tpx4_hit::coord_type coord, typename  tpx4_hit::ctoa_type ctoa, typename tpx4_hit::ftoa_type ftoa, typename tpx4_hit::uftoa_type uftoa, typename tpx4_hit::tot_type tot)
    {
      process_hit_impl(hit_type(coord, ctoa, ftoa, uftoa, tot));
    }*/

    /*void process_hits(typename hit_type::x_type* xs, typename hit_type::y_type* ys, typename hit_type::ctoa_type* toas, typename hit_type::tot_type* tots, uint64_t count)
    {
      for (uint64_t i = 0; i < count; ++i)
      {
        process_hit_impl(hit_type(xs[i], ys[i], toas[i], tots[i]));
      }
    }*/
  protected:
  
  struct parameters
  {
    static constexpr uint64_t extra_border_closing_time_ns = 5000; 
    uint64_t buffer_size;
    uint32_t host_buffer_count;
    double max_hitrate_mhz;
    int64_t low_flux_flush_hit_dt_ms;
    uint32_t sleep_duration_full_memory_ms;
    uint32_t cuda_worker_count;
    uint64_t max_unsortedness_mus;
    uint64_t toa_ns_multiplier;
    uint32_t sensor_size_y;
    uint64_t cuda_thread_count;
    
  };
    external_stream_data_reader(const node_args &args);
    bool is_source() final override { return true; }

    void set_callbacks(std::function<void(SoAClusteringType::host_data<hit_type> *)> processing_callback, std::function<void()> done_callback);

    void allocate_pinned_memory(host_data_type &host_buffer);

    typename std::vector<host_data_type>::iterator get_next_buffer();
    void switch_buffer();

    void flush_buffer();

    void process_hit_impl(hit_type &&data);

    std::string name() override { return "stream_reader"; }

    void close_cuda_output();

    virtual void start() override;
    void free_pinned_memory(host_data_type &host_buffer);
    virtual ~external_stream_data_reader() = default;

    ///  Parameters modifiable by user

    const buffer_outputting_type outputting_type = buffer_outputting_type::SINGLE_CONSUMER_MULTI_STREAM;
    //  const buffer_outputting_type outputting_type = buffer_outputting_type::SINGLE_CONSUMER_SINGLE_STREAM;
    // const buffer_outputting_type outputting_type = buffer_outputting_type::MULTI_CONSUMER_SINGLE_STREAM;

    // other parameters
    bool paused = false;
    bool done = false;
    uint32_t reading_buffer_index = 0;
    uint32_t consumer_index = 0;
    const parameters params;

    std::vector<host_data_type> host_buffers;
    typename std::vector<host_data_type>::iterator reading_buffer_;
    std::vector<std::function<void(host_data_type *)>> process_data_cuda_callbacks;
    std::vector<std::function<void()>> done_cuda_callbacks;
  };
}