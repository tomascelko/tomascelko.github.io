#pragma once
#include "data_structs/tpx3_hit.h"
#include "data_structs/tpx4_hit.h"

#include "data_structs/cluster.h"
#include "data_structs/node_args.h"
#include "data_structs/calibration.h"
#include "data_structs/clustered_data.h"
#include "i_data_node.h"
#include <cstdint>
#include <iostream>
#include <memory>
#include <thread>
#include <vector>
#include <functional>
/*#ifdef CLUSTERER_SHARED_EXPORTS
    #define CLUSTERER_SHARED_API __declspec(dllexport)
#else
    #define CLUSTERER_SHARED_API __declspec(dllimport)
#endif*/


namespace clustering
{
  class processing_speed_sample
  {
    static constexpr double epsilon = 0.00001;

  private:
    uint64_t hits_processed_;
    double timestamp_;

  public:
    processing_speed_sample(uint64_t hits_processed, double timestamp)
        : hits_processed_(hits_processed), timestamp_(timestamp) {}

    processing_speed_sample operator-(const processing_speed_sample &other)
    {
      return processing_speed_sample{hits_processed_ - other.hits_processed_,
                                     timestamp_ - other.timestamp_};
    }
    double speed() const
    {
      return timestamp_ > epsilon ? hits_processed_ / timestamp_ : 0.;
    }
    uint64_t hits_processed() const { return hits_processed_; }
    double timestamp() const { return timestamp_; }
  };

  // organizes the dataflow of all nodes in a dataflow graph
  template <typename hit_type>
  class external_stream_data_reader;

  template <typename hit_type>
  class external_cuda_clusterer;
  

  template <typename hit_type>
  class external_dataflow_controller
  {
    using log_verbosity = i_data_node::log_verbosity;
    log_verbosity verbosity = log_verbosity::ALL;
    using node_pointer = std::unique_ptr<i_data_node>;
    using output_func_type = typename std::function<void(clustered_data<hit_type>)>;
    using reader_type = external_stream_data_reader<hit_type>;
    using clusterer_type = external_cuda_clusterer<hit_type>;

    static constexpr uint64_t ns_in_s = 1000000000;

  public:

    external_dataflow_controller(const node_args &args, output_func_type output_fn, calibration *calib = nullptr);
    void run();
    external_stream_data_reader<hit_type>* input();
    void close();

  protected:
    bool is_done = false;
    std::vector<node_pointer> nodes;
    std::vector<i_data_node *> data_sources;
    std::vector<i_data_node *> data_sinks;

    reader_type* reader;
    clusterer_type* clusterer;
    

    std::vector<std::thread> threads;
    uint32_t dataflow_control_time_interval_ms = 500.;
    std::vector<processing_speed_sample> output_speed_samples;
    std::vector<processing_speed_sample> input_speed_samples;
    std::vector<double> input_hitrates;
    std::vector<double> output_hitrates;

  private:
    // taking ownership of the created node
    void register_node(i_data_node *item);

    void initialize_simple_pipeline(const node_args &args, output_func_type output_fn, calibration *calib);

    // access all available nodes
    std::vector<i_data_node *> data_nodes();
    // resets the state of the dataflow controller
    // removes the nodes, pipes and datasources
    void remove_all();

    void print_realtime_input_hit_frequency();
    void print_realtime_output_hit_frequency();
    // run all nodes, each in a separate thread
    void start_all();
    // retrieve the results from each node
    //std::vector<std::string> results();

    // blocking wait for all started nodes
    void wait_all();


       
  };
}