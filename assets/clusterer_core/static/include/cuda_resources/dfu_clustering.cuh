#pragma once
#include "data_structs/cuda_hit_buffer.cuh"
#include "utils.h"

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "math.h"

#include <vector>
#include <iostream>
//TODO REPLACE % OPERATOR
static constexpr uint8_t NEIGHBORHOOD_SIZE = 9; 
//static constexpr uint32_t LABEL_CACHE_SIZE = 128;//128;//128;//24;
//static constexpr uint32_t HIT_DATA_CACHE_SIZE = 48;//48;//2; //64
//static constexpr uint32_t LABEL_CACHE_MIDPOINT = LABEL_CACHE_SIZE / 2;
static constexpr uint32_t MAX_UINT32 = 2000000000;
//static constexpr uint16_t ROOT_CACHE_SIZE = 16;
namespace clustering {
namespace SoAClustering
{
    template<typename hit_type>
    class dfu_clusterer
    {
    private:
        const uint32_t id;
        const int32_t data_start_offset;
        const uint64_t matrix_start_offset;
        const int32_t cache_base_idx;
        const bool processing_safeguard;
        device_data<hit_type> *device;
        int32_t first_cached_idx; 
        uint16_t relative_cache_idx;
        uint16_t relative_cache_start_idx;
        bool first_cache_ready;
        uint8_t relative_root_cache_idx;
        int32_t hit_cache_start_idx;
    public:
        uint16_t* shared_label_cache;
        typename hit_type::x_type * shared_x_cache;//DFU_THREADS_PER_BLOCK * HIT_DATA_CACHE_SIZE ];
        typename hit_type::y_type* shared_y_cache;//DFU_THREADS_PER_BLOCK * HIT_DATA_CACHE_SIZE ];
        typename hit_type::toa_type * shared_toa_cache;//DFU_THREADS_PER_BLOCK * HIT_DATA_CACHE_SIZE];
    
        __device__ dfu_clusterer(uint32_t tid, device_data<hit_type> *device, bool processing_safeguard = false, uint32_t cache_start_idx = 0, uint8_t * shared_mem = nullptr);
        __device__ void process_hit(uint32_t hit_idx);
        
        __device__ void process_hit_cached(uint32_t hit_idx);
        
        __device__ void clean_hit_index_matrix(uint32_t hit_idx) const;
        
        __device__ uint32_t find_root(uint32_t representative_index, bool force_contract = false) const;
        __device__ uint32_t find_root_cached_bounded(uint32_t representative_index);
        __device__ void run_matrix_clean_check();
        __device__ uint32_t find_root_cached_unbounded(uint32_t representative_index);
        
        __device__ void flush_all_caches(uint32_t hit_idx);
        __device__ uint64_t hit_matrix_start_offset() const;
        __device__ uint32_t to_linear_coordinate(int16_t x, int16_t y) const;
    private:

        
        __device__ void store_labels_from_cache();
          
        __device__ void final_store_entire_cache(uint32_t final_idx);
        
        __device__ void update_cache(uint32_t hit_idx);
        __device__ uint32_t to_cache_idx(uint32_t hit_idx);
        
        __device__ void assign_label(uint32_t hit_idx, uint32_t label);
        
        template <typename data_type>
        __device__ void load_cache_single_array(data_type * source_start, data_type * dest_start, uint32_t hit_idx)
        {
            for (uint32_t i = hit_idx; i < hit_idx + HIT_DATA_CACHE_SIZE && i < device->hit_count; ++i)
            {
                dest_start[to_general_cache_idx(i - hit_idx)] = source_start[i];
            }
        }

        __device__ void load_hit_cache(uint32_t hit_idx);
        
        template <typename data_type>
        __device__ data_type read_hit_from_hit_cache(uint32_t hit_idx, data_type* cache_start)
        {
            if(hit_idx >= hit_cache_start_idx + HIT_DATA_CACHE_SIZE)
            {
                load_hit_cache(hit_idx);
            }
            else
            {
            }
            
            return cache_start[to_general_cache_idx((hit_idx - cache_base_idx) % HIT_DATA_CACHE_SIZE)];
        }
        
        __device__ uint32_t get_label(uint32_t hit_idx);
        __device__ uint32_t to_neighbor_matrix_idx(uint32_t idx);
        __device__ uint32_t to_general_cache_idx(uint32_t idx);
        template <typename data_type>
        __device__ void is_equal(data_type expected, data_type actual, uint32_t hit_idx)
        {
         //TODO: implement for debugging   
        }
        __device__ void compute_neighbor_ids(int16_t x, int16_t y, uint16_t* neighbor_ids);
        
    };
    }
}