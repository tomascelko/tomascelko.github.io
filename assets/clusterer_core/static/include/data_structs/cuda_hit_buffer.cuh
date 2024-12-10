#pragma once
#include "node_args.h"

#include <iostream>

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "devices/current_device.h"
namespace clustering
{
  extern __constant__ uint64_t TOA_NS_MULTIPLIER;
  extern __constant__ uint64_t MAX_CLUSTER_JOIN_TIME;
  extern __constant__ uint64_t MAX_HIT_COUNT;
  extern __constant__ uint32_t APPROX_HITS_PER_WORKER;
  extern __constant__ uint32_t MATRIX_SIZE;
  extern __constant__ uint32_t MATRIX_HEIGHT;
  extern __constant__ uint32_t MATRIX_WIDTH;
  extern __constant__ uint32_t TOTAL_THREAD_COUNT;
  extern __constant__ uint32_t PADDED_MATRIX_WIDTH;
  extern __constant__ uint16_t DFU_THREADS_PER_BLOCK;
  extern __constant__ uint16_t INIT_DFU_THREADS_PER_BLOCK;
  extern __constant__ uint32_t DFU_BLOCK_COUNT;
  extern __constant__ uint32_t LABEL_CACHE_SIZE;
  extern __constant__ uint32_t LABEL_CACHE_MIDPOINT;
  extern __constant__ uint32_t HIT_DATA_CACHE_SIZE;
  
  /*__constant__ uint16_t UNRESTRICTED_THREADS_PER_BLOCK;
  __constant__ uint32_t UNRESTRICTED_THREAD_COUNT;
  __constant__ uint32_t UNRESTRICTED_HITS_PER_WORKER;
  __constant__ uint32_t UNRESTRICTED_BLOCK_COUNT;
  */
  extern __constant__ bool ONLINE_CONTRACT_DFU_PATH;
  extern __constant__ bool USE_LABEL_CACHE_NORMAL;
  extern __constant__ bool USE_LABEL_CACHE_BORDER;
  
   
  
  
  
namespace SoAClustering{
  template <typename hit_type>
  struct hit_data_buffer
  {
    using x_t = typename hit_type::x_type;
    using y_t = typename hit_type::y_type;
    using toa_t = typename hit_type::toa_type;
    using tot_t = typename hit_type::tot_type;
    x_t * x;
    y_t* y;
    tot_t* tot;
    toa_t * toa;
    uint64_t current_index_ = 0;
    uint64_t max_size;
    const uint64_t end_buffer_free_space;// = unsortedness_window_mus * max_supported_hitrate_mhz;
    const uint64_t border_toa_offset_to_max_toa_mult_ns;// = 5000 *  TOA_NS_MULTIPLIER; //TODO use
    const uint64_t toa_ns_multiplier;
    const uint64_t toa_precision_digits_ns;
    const uint64_t unsortedness_window_mus;
    const uint32_t sensor_size_y;
    uint64_t max_buffer_toa = 0;
    bool can_push = true;
    static constexpr uint64_t ns_in_mus = 1000;
    //hit_data_buffer();
    hit_data_buffer(uint64_t max_size, uint64_t end_buffer_free_space, uint64_t border_toa_offset_to_max_toa_ns, uint64_t toa_ns_multiplier, uint64_t unsortedness_window_mus, uint32_t sensor_size_y);

    uint32_t size();
    bool can_switch_buffer(const hit_type & hit);
    uint64_t border_time();
    bool can_push_back(const hit_type & hit);

    bool push_back(hit_type && hit);

    void clear();
    bool can_reuse();
    void seal();
    const x_t * xs() const {return x;}
    const y_t * ys() const{return y;}
    const toa_t * toas() const {return toa;}
    const tot_t * tots() const {return tot;}
    
  };

  static constexpr uint32_t SAFE_THREAD_BLOCK = 1;
  struct device_metadata
  {
    //TODO: START WITH REPLACING ARGS WITH __constant__ -> see if we need them on host, if not
    //then just replace and copy data to __constant__
    //IMPORTANT: DO COPYING DURING BUFFER DATA ALLOCATION iN CONSTRUCTOR OF EXTERNAL_CUDA_CLUSTERER 
    //static constexpr uint32_t max_cluster_join_time = 200 * hit_data_buffer::TOA_NS_MULTIPLIER;
/*
    static constexpr uint32_t max_hit_count = 38400000; //or 38400000 * 3
    static constexpr uint32_t total_thread_count = 3840;//3840;// or 8848
    static constexpr uint32_t approx_hits_per_worker = max_hit_count / total_thread_count;
    
    //FIXME: temporarily useless
    //static constexpr uint32_t max_cluster_timespan = 1000 * hit_data_buffer::TOA_NS_MULTIPLIER;

    static constexpr uint32_t matrix_padding_size = 2;
    static constexpr uint32_t matrix_size = (256 + matrix_padding_size) * (256 + matrix_padding_size);
    static constexpr uint16_t matrix_height = 2 << 7;
    static constexpr uint16_t matrix_width = 2 << 7;
    static constexpr uint32_t padded_matrix_width = (2 << 7) + matrix_padding_size;
    static constexpr uint16_t dfu_threads_per_block = 64;
    static constexpr uint16_t init_dfu_threads_per_block = 256;
    static constexpr uint16_t dfu_block_count = (device_metadata::total_thread_count / DFU_THREADS_PER_BLOCK) + SAFE_THREAD_BLOCK;

    static constexpr uint16_t unrestricted_threads_per_block = 256;
    static constexpr uint32_t unrestricted_thread_count = 3840 * 16;
    static constexpr uint16_t unrestricted_hits_per_worker = max_hit_count / unrestricted_thread_count;
    static constexpr uint16_t unrestricted_block_count = (unrestricted_thread_count / unrestricted_threads_per_block) + 1;
    
    
    static constexpr bool online_contract_dfu_path = true;
    static constexpr bool use_global_neighborhood = true;
    
    static constexpr bool use_label_cache_normal = true;
    static constexpr bool use_label_cache_border = true;
    */
    //uint64_t* tile_border_data;
    //initialize to -1s
    //need to cleanup to -1 after clusters are identified
    uint16_t* hit_index_matrices;
    uint32_t* labels;
    //uint16_t* offset_to_last_toa; 
  };

  struct host_metadata
  {
    uint32_t* labels;
    const uint32_t* label() const {return labels;}
  };

  template <typename hit_type>
  struct host_data
  {
    host_metadata metadata;
    hit_data_buffer<hit_type> data;
    uint64_t hit_count;
    bool is_final = false;
    host_data(uint64_t max_size, uint64_t end_buffer_free_space, uint64_t border_toa_offset_to_max_toa_ns, uint64_t toa_ns_multiplier, uint64_t unsortedness_window_mus, uint32_t sensor_size_y);
  };

  template <typename hit_data>
  struct device_data
  {
    device_metadata metadata;
    hit_data_buffer<hit_data> data;
    uint32_t hit_count;
    cudaStream_t stream;
    bool is_final = false;
    //device_data(bool create_custom_stream  = false);
    device_data(/*cudaStream_t cudaStream*/ uint64_t max_hit_count);
  };

  class  cuda_coord
  {

public:
    __device__ cuda_coord() {}
    __device__ cuda_coord(int16_t x, int16_t y) : m_x(x),
                                             m_y(y) {}

    __device__ int16_t x() const
    {
        return m_x;
    }
    __device__ int16_t y() const
    {
        return m_y;
    }

    __device__ cuda_coord operator+(const cuda_coord &right)
    {
        return cuda_coord(this->x() + right.x(), this->y() + right.y());
    }
    int16_t m_x;
    int16_t m_y;
};

}
template<typename T>
__device__ T max(T left, T right)
{
  return left < right ? right : left;
}

template<typename T>
__device__ T min(T left, T right)
{
  return left < right ? left : right;
}

/*
namespace SoATClustering{
  struct hit_data_buffer
  {
    uint8_t* x;
    uint8_t* y;
    uint16_t* tot;
    uint64_t* toa;
    uint32_t current_index_ = 0;
    uint64_t max_size;
    const uint64_t end_buffer_free_space; // = unsortedness_window_mus * max_supported_hitrate_mhz;
    const uint64_t border_toa_offset_to_max_toa_mult_ns;// = 5000 *  TOA_NS_MULTIPLIER; //TODO use
    const uint64_t toa_ns_multiplier;
    const uint64_t unsortedness_window_mus;
    static constexpr uint64_t ns_in_mus = 1000;
    uint64_t max_buffer_toa = 0;
    bool can_push = true;
    hit_data_buffer();
    hit_data_buffer(uint64_t max_size, uint64_t end_buffer_free_space, uint64_t border_toa_offset_to_max_toa_ns, uint64_t toa_ns_multiplier, uint64_t unsortedness_window_mus);
    uint32_t size();
    bool can_switch_buffer(const tpx3_hit & hit);
    uint64_t border_time();
    bool can_push_back(const tpx3_hit & hit);

    bool push_back(tpx3_hit && hit);

    void clear();
    bool can_reuse();
    void seal();
  };

  static constexpr uint32_t SAFE_THREAD_BLOCK = 1;
  struct device_metadata
  {
    //static constexpr uint32_t max_cluster_join_time = 200 * hit_data_buffer::TOA_NS_MULTIPLIER;
/*
    static constexpr uint32_t max_hit_count = 38400000; //or 38400000 * 3
    static constexpr uint32_t total_thread_count = 3840;//3840;// or 8848
    static constexpr uint32_t approx_hits_per_worker = max_hit_count / total_thread_count;
    static constexpr uint32_t max_cluster_timespan = 1000 * hit_data_buffer::TOA_NS_MULTIPLIER;

    static constexpr uint32_t matrix_padding_size = 2;
    static constexpr uint32_t matrix_size = (256 + matrix_padding_size) * (256 + matrix_padding_size);
    static constexpr uint16_t matrix_height = 2 << 7;
    static constexpr uint16_t matrix_width = 2 << 7;
    static constexpr uint32_t padded_matrix_width = (2 << 7) + matrix_padding_size;
    static constexpr uint16_t dfu_threads_per_block = 64;
    static constexpr uint16_t init_dfu_threads_per_block = 256;
    static constexpr uint16_t dfu_block_count = (device_metadata::total_thread_count / device_metadata::dfu_threads_per_block) + SAFE_THREAD_BLOCK;

    static constexpr uint16_t unrestricted_threads_per_block = 256;
    static constexpr uint32_t unrestricted_thread_count = 3840 * 16;
    static constexpr uint16_t unrestricted_hits_per_worker = max_hit_count / unrestricted_thread_count;
    static constexpr uint16_t unrestricted_block_count = (unrestricted_thread_count / unrestricted_threads_per_block) + 1;
    
    
    static constexpr bool online_contract_dfu_path = true;
    static constexpr bool use_global_neighborhood = true;
    
    static constexpr bool use_label_cache_normal = true;
    static constexpr bool use_label_cache_border = true;
    *//*
    //uint64_t* tile_border_data;
    //initialize to -1s
    //need to cleanup to -1 after clusters are identified
    uint16_t* hit_index_matrices;
    uint32_t* labels;
    //uint16_t* offset_to_last_toa; 
  };

 
  struct device_data
  {
    device_metadata metadata;
    hit_data_buffer data;
    uint32_t hit_count;
    cudaStream_t stream;
    bool is_final = false;
    device_data(uint64_t max_hit_count);
    //device_data(cudaStream_t cudaStream);
  };

  class  cuda_coord
  {

public:
    __device__ cuda_coord() {}
    __device__ cuda_coord(int16_t x, int16_t y) : m_x(x),
                                             m_y(y) {}

    __device__ int16_t x() const
    {
        return m_x;
    }
    __device__ int16_t y() const
    {
        return m_y;
    }

    __device__ cuda_coord operator+(const cuda_coord &right)
    {
        return cuda_coord(this->x() + right.x(), this->y() + right.y());
    }
    int16_t m_x;
    int16_t m_y;
};*/
}

