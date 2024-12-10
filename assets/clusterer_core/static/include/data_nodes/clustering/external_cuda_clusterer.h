
#pragma once
#include "data_flow/dataflow_package.h"

#include "data_structs/calibration.h"
#include "data_structs/cuda_hit_buffer.cuh"
#include "utils.h"
#include "cuda_resources/cuda_kernels.cuh"
//#include "../../cuda_resources/cuda_kernels_transposed.cuh"
#include "cuda_resources/dfu_clustering.cuh"
#include "data_structs/clustered_data.h"
//#include "cuda_runtime.h"
//#include "device_launch_parameters.h"

#include <algorithm>
#include <cassert>
#include <queue>
#include <type_traits>
#include <chrono>
#include <limits>
#include <cstdint>
// converts the burda hit to mm_hit
// computes energy, and time in nanoseconds

namespace clustering
{
using namespace std::chrono_literals;
namespace SoAClusteringType = SoAClustering;
/*template <typename hit_type>
class external_dataflow_controller;
*/
template <typename hit_type>
class external_cuda_clusterer
    : public i_data_node
  {

    protected:
    using output_func_type = typename std::function<void(clustered_data<hit_type>)>;
    struct parameters 
    {
      static constexpr uint32_t matrix_padding_size = 2;
      uint64_t buffer_size;
      uint64_t max_unsortedness_mus;
      uint32_t chip_sensor_size_x;
      uint32_t chip_sensor_size_y;
      uint32_t cuda_streams_per_worker;
      uint32_t cuda_thread_count;
      uint16_t cuda_clustering_threads_per_block;
      uint32_t cuda_min_launch_stream_count;
      uint32_t cuda_sleep_duration_empty_ms;
      uint32_t cuda_aux_matrix_size;
      uint64_t toa_ns_multiplier;
      bool use_label_cache_normal;
      bool use_label_cache_border;
      uint32_t label_cache_size;
      uint32_t hit_data_cache_size;
      uint16_t init_threads_per_block;
      uint64_t max_cluster_join_time_ns;
      uint32_t shared_memory_bytes;


    };
  bool calibrate;
  std::unique_ptr<calibration> calibrator;
  output_func_type output_fn; 
  std::vector<SoAClusteringType::device_data<hit_type>*> devs;
  std::deque<SoAClusteringType::host_data<hit_type>*> host_buffers_to_process;
  parameters params;
  bool done = false;
  std::chrono::milliseconds empty_sleep_time{10ms};
  const bool flush_on_dt = false;
  double last_t = 0;
  //std::vector<int32_t> cluster_id_map = std::vector(SoAClusteringType::MAX_HIT_COUNT, -1);
  friend class external_dataflow_controller<hit_type>;

  static constexpr uint64_t US_IN_MS = 1000;

  external_cuda_clusterer(const node_args & args, output_func_type output_fn, calibration* calib = nullptr);

  std::string name() override { return "cuda_clusterer"; }
  
  void initialize_cuda_constants();
 
  void receive_data_callback(SoAClusteringType::host_data<hit_type>* host_data);

  void done_callback();
  mm_hit convert_hit(uint8_t x, uint8_t y, uint64_t int_toa, uint16_t tot);
  void output_clusters(SoAClusteringType::host_data<hit_type> * host);
  virtual void start() override;
  virtual ~external_cuda_clusterer();
  
};
}