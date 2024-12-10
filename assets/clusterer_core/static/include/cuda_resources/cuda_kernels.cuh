#pragma once
#include "utils.h"
//#include "cuda_resources/dfu_clustering.cuh"
#include "data_structs/cuda_hit_buffer.cuh"

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/generate.h>
#include <thrust/sort.h>
#include <thrust/copy.h>
#include <thrust/random.h>
namespace clustering{
namespace SoAClustering
{
        template<typename hit_type>
        struct gpu_interface
        {

        static void copy_data_to_device(host_data<hit_type>* host_data, device_data<hit_type> * dev);
        static void copy_data_from_device(host_data<hit_type> *host_data, device_data<hit_type> *dev);
        static void init_dfu(device_data<hit_type> dev, uint32_t total_thread_count, uint64_t matrix_size, uint32_t init_dfu_threads_per_block);
        static device_data<hit_type> *initialize_device_memory(uint64_t max_hit_count, uint64_t total_thread_count, uint64_t matrix_size, uint32_t init_dfu_threads_per_block);
        static void deallocate_device_memory(device_data<hit_type> *dev);
        static void sort_data(device_data<hit_type> dev);
        static void sort_by_labels(device_data<hit_type> dev);
        static void label_dfu_clusters(device_data<hit_type> dev, uint32_t total_thread_count, uint32_t dfu_threads_per_block, uint32_t max_hit_count, uint32_t shared_memory_bytes);
        };

        template<typename hit_type>
        struct kernel_implementation
        {
            __device__ static void compute_dfu_no_clean(device_data<hit_type> dev);
            __device__ static void connect_dfu_border_path_no_clean(device_data<hit_type> dev);
            __device__ static void clean_dfu_hit_matrices(device_data<hit_type> dev);
            __device__ static void init_dfu_hit_matrices(device_data<hit_type> dev);
            __device__ static void shorten_dfu_paths(device_data<hit_type> dev);
        };

        //using device_data_type = device_data<hit_type>;
        //using host_data_type = host_data<hit_type>;
        //global functions do not like to be a member function
        //global functions also should not be implemented elsewhere
        template<typename hit_type>
        __global__ void kernel_compute_dfu_no_clean(device_data<hit_type> dev)
        {
            kernel_implementation<hit_type>::compute_dfu_no_clean(dev);
        }

        template<typename hit_type>
        __global__ void kernel_connect_dfu_border_path_no_clean(device_data<hit_type> dev)
        {
            kernel_implementation<hit_type>::connect_dfu_border_path_no_clean(dev);
        }

        template<typename hit_type>
        __global__ void kernel_clean_dfu_hit_matrices(device_data<hit_type> dev)
        {
            kernel_implementation<hit_type>::clean_dfu_hit_matrices(dev);
        }

        template<typename hit_type>
        __global__ void kernel_init_dfu_hit_matrices(device_data<hit_type> dev)
        {
            kernel_implementation<hit_type>::init_dfu_hit_matrices(dev);
        }

        template<typename hit_type>
        __global__ void kernel_shorten_dfu_paths(device_data<hit_type> dev)
        {
            kernel_implementation<hit_type>::shorten_dfu_paths(dev);
        }
    
};
}