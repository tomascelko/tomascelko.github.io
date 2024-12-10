#pragma once
#include <iostream>
#include <fstream>
// interface defines base properties of the node
namespace clustering
{
  class i_data_node
  {
  public:
    enum class log_verbosity
    {
      NO_LOGS,
      INFO,
      ALL

    };

  protected:
    // identifier
    uint32_t id = 1;
    uint64_t total_hits_processed_ = 0;
    log_verbosity verbosity = log_verbosity::ALL;
#ifdef BUILD_DEBUG
    #define LOG_DEBUG(msg) \
        do { \
            if (static_cast<uint32_t>(verbosity) >= static_cast<uint32_t>(log_verbosity::ALL)) { \
                std::cout << "DEBUG: " << msg << std::endl; \
            } \
        } while (0)
#else
    #define LOG_DEBUG(msg) \
        do { } while (0)
#endif

#ifdef ENABLE_INFO_LOGGING // if set to false, no info logging will happen
#define LOG_INFO(msg)                                                                 \
  if (static_cast<uint32_t>(verbosity) >= static_cast<uint32_t>(log_verbosity::INFO)) \
    (std::cout << "INFO: " << msg);
#else
#define LOG_INFO(msg)
#endif



  public:
    uint32_t get_id()
    {
      return id;
    }
    void set_id(uint32_t new_id) { id = new_id; }
    // node name (type)
    virtual std::string name() = 0;
    // start the run of a node
    virtual void start() = 0;

    // return result of the node computation converted to string, if any
    uint64_t get_total_hit_count() { return total_hits_processed_; }

    virtual bool is_sink() { return false; }
    virtual bool is_source() { return true; }
    virtual std::string result() { return ""; }
    virtual ~i_data_node() = default;
  };
}
